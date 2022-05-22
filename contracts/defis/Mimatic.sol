// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";
import { IMimaticVaultHolder, IcamERC20, IMimaticVaultLiquidator } from "./mimatic/Interfaces.sol";

contract Mimatic is Base {
  using BytesDecoder for bytes;
  using SafeMath for uint256;

  function __version() override public pure returns(uint256) {
       return 1;
  }
  
  function _storageKeyVaultId(address vaultHolder) internal pure returns(bytes32) {
    return keccak256(abi.encode(vaultHolder));
  }
  
  function _createVault(address vaultHolder) internal returns(uint256) {
    uint256 vaultId = IMimaticVaultHolder(vaultHolder).createVault();
    _setSlot0(_storageKeyVaultId(vaultHolder), abi.encode(vaultId));
    return vaultId;
  }

  function _existingVaultId(address vaultHolder) internal returns(uint256) {
    bytes32 storageKey = _storageKeyVaultId(vaultHolder);
    if(slot0KeyExists(storageKey)){
      uint256 existingVault = abi.decode(slot0Value(storageKey), (uint256));
      if(existingVault != 0){
        return existingVault;
      }
    }
    return _createVault(vaultHolder);
  }

  function _removeVaultFromMemory(address vaultHolder) internal {
    _setSlot0(_storageKeyVaultId(vaultHolder), new bytes(0));
  }

  function getVaultId(bytes memory vaultHolderEncoded) public returns(bytes memory) {
    return abi.encode(_existingVaultId(execute(vaultHolderEncoded).toAddress()));
  }
  
  function initVaultId(bytes memory vaultHolderEncoded, bytes memory vaultIdEncoded) public  returns(bytes memory){
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 vaultId = execute(vaultIdEncoded).toUint256();
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    if((vault.getApproved(vaultId) == address(this) || vault.isApprovedForAll(msg.sender, address(this)))
       && vault.ownerOf(vaultId) == msg.sender) {
      vault.transferFrom(msg.sender, address(this), vaultId);
    }
    require(vault.ownerOf(vaultId) == address(this), "Vault ID is not owned by contract");
    _setSlot0(_storageKeyVaultId(vaultHolder), abi.encode(vaultId));
    return abi.encode(vaultId);
  }

  function createVault(bytes memory vaultHolderEncoded) public  returns(bytes memory) {
    return abi.encode(_existingVaultId(execute(vaultHolderEncoded).toAddress()));
  }

  function depositCollateral(bytes memory vaultHolderEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 percentage = execute(percentageEncoded).toUint256();
    require(percentage <= 100);
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    IERC20 collateral = IERC20(vault.collateral());
    uint256 balance = collateral.balanceOf(address(this));
    uint256 toDeposit = balance.mul(percentage).div(100);
    if(toDeposit > 0) {
      collateral.approve(vaultHolder, toDeposit);
      vault.depositCollateral(vaultId, toDeposit);
    }
    return abi.encode(toDeposit);
  }

  function transferVault(bytes memory vaultHolderEncoded, bytes memory nextOwnerEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    address nextOwner = execute(nextOwnerEncoded).toAddress();
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    vault.transferFrom(address(this), nextOwner, vaultId);
    _removeVaultFromMemory(vaultHolder);
    return abi.encode(true);
  }

  function _repay(address vaultHolder, uint256 amount) internal returns(uint256){
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    uint256 debtValue = vault.vaultDebt(vaultId);
    IERC20 mai = IERC20(vault.mai());
    if(debtValue < amount){
      amount = debtValue;
    }
    if(amount > mai.balanceOf(address(this))){
      amount = mai.balanceOf(address(this));
    }
    if(amount > 0){
      mai.approve(vaultHolder, amount);
      vault.payBackToken(vaultId, amount);
    }
    return amount;
  }
  
  function repayExactMai(bytes memory vaultHolderEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 amount = execute(amountEncoded).toUint256();
    return abi.encode(_repay(vaultHolder, amount));
  }

  function repayMai(bytes memory vaultHolderEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 percentage = execute(percentageEncoded).toUint256();
    require(percentage <= 100);
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    uint256 debtValue = vault.vaultDebt(vaultId);
    uint256 amount = debtValue.mul(percentage).div(100);
    return abi.encode(_repay(vaultHolder, amount));
  }

  function _maxAvailableToBorrow(address vaultHolder) internal returns(uint256) {
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    uint256 vaultId = _existingVaultId(vaultHolder);
    uint256 debtValue = vault.vaultDebt(vaultId);
    IERC20Metadata collateral = IERC20Metadata(vault.collateral());
    IERC20Metadata mai = IERC20Metadata(vault.mai());
    uint256 availableToBorrow = 0;
    {
      uint256 collateralAmount = vault.vaultCollateral(vaultId);
      uint256 collateralValue = collateralAmount
        .mul(vault.getEthPriceSource())
        .mul(10**(uint256(mai.decimals())
                  .sub(uint256(collateral.decimals()))));
      uint256 minCollateralPercentage = vault._minimumCollateralPercentage();
      uint256 maxDebt = collateralValue
        .mul(100)
        .div(minCollateralPercentage)
        .div(10**(uint256(vault.priceSourceDecimals())));
      availableToBorrow = maxDebt.sub(debtValue);
      uint256 ceiling = vault.getDebtCeiling();
      if(ceiling < availableToBorrow){
        availableToBorrow = ceiling;
      }
    }
    return availableToBorrow;
  }
  
  function _borrow(address vaultHolder, uint256 amount) internal returns(uint256) {
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    uint256 vaultId = _existingVaultId(vaultHolder);
    uint256 availableToBorrow = _maxAvailableToBorrow(vaultHolder);
    
    if(amount > availableToBorrow){
      amount = availableToBorrow;
    }
    if(amount > 0){
      vault.borrowToken(vaultId, amount);
    }
    return amount;
    
  }

  function borrowExactMai(bytes memory vaultHolderEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 amount = execute(amountEncoded).toUint256();
    return abi.encode(_borrow(vaultHolder, amount));
  }
  
  function borrowMai(bytes memory vaultHolderEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 percentage = execute(percentageEncoded).toUint256();
    uint256 maxAvailable = _maxAvailableToBorrow(vaultHolder);
    uint256 amount = maxAvailable.mul(percentage).div(100);
    return abi.encode(_borrow(vaultHolder, amount));
  }
  
  function getDebt(bytes memory vaultHolderEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    return abi.encode(vault.vaultDebt(vaultId));
  }

  function getCollateral(bytes memory vaultHolderEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    return abi.encode(vault.vaultCollateral(vaultId));
  }

  function getCollateralPercentage(bytes memory vaultHolderEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 vaultId = _existingVaultId(vaultHolder);
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    return abi.encode(vault.checkCollateralPercentage(vaultId));
  }

  function getMinCollateralPercentage(bytes memory vaultHolderEncoded) public  returns(bytes memory){
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    return abi.encode(vault._minimumCollateralPercentage());
  }
  
  function getVaultCeiling(bytes memory vaultHolderEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    return abi.encode(vault.getDebtCeiling());
  }

  function liquidate(bytes memory vaultHolderEncoded, bytes memory vaultIdEncoded) public  returns(bytes memory) {
    address vaultHolder = execute(vaultHolderEncoded).toAddress();
    uint256 vaultId = execute(vaultIdEncoded).toUint256();
    IMimaticVaultHolder vault = IMimaticVaultHolder(vaultHolder);
    address liquidatorAddress = vault.stabilityPool() == address(0) ? vaultHolder : vault.stabilityPool();
    IMimaticVaultLiquidator liquidator = IMimaticVaultLiquidator(liquidatorAddress);
    if(vault.checkCollateralPercentage(vaultId) < vault._minimumCollateralPercentage()){
      uint256 halfDebt = vault.vaultDebt(vaultId).div(vault.debtRatio());
      IERC20 mai = IERC20(vault.mai());

      if(mai.balanceOf(address(this)) <= halfDebt) {
        uint256 needed = halfDebt.sub(mai.balanceOf(address(this)));
        if(mai.allowance(msg.sender, address(this)) >= needed && mai.balanceOf(msg.sender) >= needed){
          mai.transferFrom(msg.sender, address(this), needed);
        }
      }
      if(mai.balanceOf(address(this)) >= halfDebt){
        mai.approve(vaultHolder, halfDebt);
        liquidator.liquidateVault(vaultId);
        liquidator.getPaid();
        return abi.encode(true);
      }
    }
    return abi.encode(false);
  }
  
  function wrapCamToken(bytes memory tokenAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
    address tokenAddress = execute(tokenAddressEncoded).toAddress();
    uint256 percentage = execute(percentageEncoded).toUint256();
    IcamERC20 token = IcamERC20(tokenAddress);
    IERC20 aaveToken = IERC20(token.Token());
    uint256 balance = aaveToken.balanceOf(address(this));
    uint256 amount = balance.mul(percentage).div(100);
    if(amount > 0){
      aaveToken.approve(tokenAddress, amount);
      token.enter(amount);
    }
    return abi.encode(amount);
  }

  function unwrapCamToken(bytes memory tokenAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
    address tokenAddress = execute(tokenAddressEncoded).toAddress();
    uint256 percentage = execute(percentageEncoded).toUint256();
    IcamERC20 token = IcamERC20(tokenAddress);
    uint256 balance = token.balanceOf(address(this));
    uint256 amount = balance.mul(percentage).div(100);
    if(amount > 0){
      token.leave(amount);
    }
    return abi.encode(amount);
  }

  
}
