// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";
import { IYearnVault } from "./yearn/Interfaces.sol";


contract Yearn is Base {
  using SafeMath for uint256;
  using BytesDecoder for bytes;
  function __version() override public pure returns(uint256) {
    return 1;
  }
  function _depositToken(address vaultAddress, uint256 amount) internal returns(uint256) {
      
      IYearnVault vault = IYearnVault(vaultAddress);
      IERC20 token = IERC20(vault.token());

      uint256 balance = token.balanceOf(address(this));

      if(balance < amount){
          if(token.allowance(msg.sender, address(this)) >= amount.sub(balance)){
              if(token.balanceOf(msg.sender) >= amount.sub(balance)){
                  token.transferFrom(msg.sender, address(this), amount.sub(balance));
              } else {
                  token.transferFrom(msg.sender, address(this), token.balanceOf(msg.sender));
              }
          }
      }
      balance = token.balanceOf(address(this));
      if(balance < amount){
          amount = balance;
      }
      
      
      if(amount > 0){
          token.approve(vaultAddress, amount);
          vault.deposit(amount);
      }
      return amount;
  }

  
  function depositTokenPercentage(bytes memory vaultAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
      uint256 percentage = execute(percentageEncoded).toUint256();
      address vaultAddress = execute(vaultAddressEncoded).toAddress();
      require(percentage <= 100);
      IYearnVault vault = IYearnVault(vaultAddress);
      IERC20 token = IERC20(vault.token());
      uint256 balance = token.balanceOf(address(this));
      uint256 amount = balance.mul(percentage).div(100);
      
      return abi.encode(_depositToken(vaultAddress, amount));
  }

  function depositTokenAmount(bytes memory vaultAddressEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
      uint256 amount = execute(amountEncoded).toUint256();
      address vaultAddress = execute(vaultAddressEncoded).toAddress();
      
      return abi.encode(_depositToken(vaultAddress, amount));
  }

  function _withdrawToken(address vaultAddress, uint256 amount) internal returns(uint256){
      IYearnVault vault = IYearnVault(vaultAddress);
            
      uint256 balance = vault.balanceOf(address(this));

      if(balance < amount) {
          amount = balance;
      }

      if(amount > 0){
          vault.withdraw(amount);
      }
      return amount;
  }
  
  function withdrawTokenPercentage(bytes memory vaultAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
      uint256 percentage = execute(percentageEncoded).toUint256();
      address vaultAddress = execute(vaultAddressEncoded).toAddress();
      
      require(percentage <= 100);
      
      IYearnVault vault = IYearnVault(vaultAddress);
            
      uint256 balance = vault.balanceOf(address(this));
      uint256 amount = balance.mul(percentage).div(100);
      
      return abi.encode(_withdrawToken(vaultAddress, amount));
  }

  function withdrawTokenAmount(bytes memory vaultAddressEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
      uint256 amount = execute(amountEncoded).toUint256();
      address vaultAddress = execute(vaultAddressEncoded).toAddress();
      
      return abi.encode(_withdrawToken(vaultAddress, amount));
  }
  
}
