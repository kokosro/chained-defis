// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";
import { ITombMasonary } from "./tomb/Interfaces.sol";


contract Tomb is Base {
  using SafeMath for uint256;
  using BytesDecoder for bytes;
  function __version() override public pure returns(uint256) {
    return 1;
  }
  function _claimAvailableRewards(address masonaryAddress) internal returns(uint256) {
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      if(masonary.canClaimReward(address(this))){
          IERC20 tomb = IERC20(masonary.tomb());
          uint256 balanceBeforeClaim = tomb.balanceOf(address(this));
          masonary.claimReward();
          uint256 balanceAfterClaim = tomb.balanceOf(address(this));
          if( balanceAfterClaim >= balanceBeforeClaim){
              return balanceAfterClaim.sub(balanceBeforeClaim);
          }
          return 0;
      }
      return 0;
  }
  
  function claimAvailableRewards(bytes memory masonaryAddressEncoded) public  returns(bytes memory){
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      return abi.encode(_claimAvailableRewards(masonaryAddress));
      
  }

  function canClaimRewards(bytes memory masonaryAddressEncoded) public returns(bytes memory){
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      return abi.encode(masonary.canClaimReward(address(this)));
  }

  function sharesCount(bytes memory masonaryAddressEncoded) public returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      return abi.encode(masonary.balanceOf(address(this)));
  }

  function earnedAmount(bytes memory masonaryAddressEncoded) public returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      return abi.encode(masonary.earned(address(this)));
  }

  
  function canUnstakeShares(bytes memory masonaryAddressEncoded) public returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      return abi.encode(masonary.canWithdraw(address(this)));
  }


  function _stakeShares(address masonaryAddress, uint256 amount) internal returns(uint256) {
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      IERC20 token = IERC20(masonary.share());
      
      _claimAvailableRewards(masonaryAddress);
      
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
          token.approve(address(masonary), amount);
          masonary.stake(amount);
      }
      return amount;
  }
  
  function stakeSharesPercentage(bytes memory masonaryAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      uint256 percentage = execute(percentageEncoded).toUint256();
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      IERC20 share = IERC20(masonary.share());
      _claimAvailableRewards(masonaryAddress);
      uint256 balance = share.balanceOf(address(this));
      uint256 amount = balance.mul(percentage).div(100);

      
      
      return abi.encode(_stakeShares(masonaryAddress, amount));
  }

  function stakeSharesAmount(bytes memory masonaryAddressEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();

      uint256 amount = execute(amountEncoded).toUint256();
      
      
      return abi.encode(_stakeShares(masonaryAddress, amount));
  }

  function _unstakeShares(address masonaryAddress, uint256 amount) internal returns(uint256){
      
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      if(!masonary.canWithdraw(address(this))){
          return 0;
      }
      uint256 balance = masonary.balanceOf(address(this));
      if(amount > balance){
          amount = balance;
      }
      if(amount > 0){
          masonary.withdraw(amount);
      }
      return amount;
  }
  
  function unstakeSharesPercentage(bytes memory masonaryAddressEncoded, bytes memory percentageEncoded) public  returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      uint256 percentage = execute(percentageEncoded).toUint256();
      
      ITombMasonary masonary = ITombMasonary(masonaryAddress);
      uint256 balance = masonary.balanceOf(address(this));
      uint256 amount = balance.mul(percentage).div(100);

      return abi.encode(_unstakeShares(masonaryAddress, amount));
  }

  function unstakeSharesAmount(bytes memory masonaryAddressEncoded, bytes memory amountEncoded) public  returns(bytes memory) {
      address masonaryAddress = execute(masonaryAddressEncoded).toAddress();
      uint256 amount = execute(amountEncoded).toUint256();

      return abi.encode(_unstakeShares(masonaryAddress, amount));
      
  }

  function getTombPrice(bytes memory treasuryAddressEncoded) public (bytes memory) {
      address treasuryAddress = execute(treasuryAddressEncoded).toAddress();
      ITombTreasury treasury = ITombTreasury(treasuryAddress);
      return abi.encode(treasury.getTombPrice());
  }
  function getTombUpdatedPrice(bytes memory treasuryAddressEncoded) public (bytes memory) {
      address treasuryAddress = execute(treasuryAddressEncoded).toAddress();
      ITombTreasury treasury = ITombTreasury(treasuryAddress);
      return abi.encode(treasury.getTombUpdatedPrice());
  }

  function canBuyBonds(bytes memory treasuryAddressEncoded) public (bytes memory) {
      address treasuryAddress = execute(treasuryAddressEncoded).toAddress();
      abi.encode(_canBuyBonds(treasuryAddress));
  }
  
  function buyBondsPercentage(bytes memory treasuryAddressEncoded, bytes memory percentageEncoded) public  (bytes memory) {
      address treasuryAddress = execute(treasuryAddressEncoded).toAddress();
      ITombTreasury treasury = ITombTreasury(treasuryAddress);
      
  }
}
