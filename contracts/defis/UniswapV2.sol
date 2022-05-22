// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "../Base.sol";

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import { BytesDecoder } from "../libraries/BytesDecoder.sol";
import { IUniswapRouterV2, IUniswapFactoryV2, IUniswapPairV2, IUniswapV2Callee } from "./uniswap/Interfaces.sol";

contract UniswapV2 is Base, IUniswapV2Callee {
  using SafeMath for uint256;
  using BytesDecoder for bytes;

  struct FlashLoanRequestParams {
      address token;
      uint256 amount;
      uint256 premium;
      address pair;
      bytes callbackInstruction;
  }
  function __version() override public pure returns(uint256) {
    return 1;
  }
  function _swapRouter(address routerAddress, address fromTokenAddress, address toTokenAddress, uint256 amount) internal returns(uint256) {
      IUniswapRouterV2 router = IUniswapRouterV2(routerAddress);
      IERC20 fromToken = IERC20(fromTokenAddress);
      IERC20 toToken = IERC20(toTokenAddress);
      
      uint256 balance = fromToken.balanceOf(address(this));

      if(balance < amount) {
          if(fromToken.allowance(msg.sender, address(this)) >= amount.sub(balance)){
              if(fromToken.balanceOf(msg.sender) >= amount.sub(balance)){
                  fromToken.transferFrom(msg.sender, address(this), amount.sub(balance));
              }
          }
          balance = fromToken.balanceOf(address(this));
      }
      if(balance < amount){
          amount = balance;
      }
      if(amount == 0){
          return 0;
      }
      fromToken.approve(routerAddress, amount);
      
      address[] memory path = new address[](2);
      path[0] = fromTokenAddress;
      path[1] = toTokenAddress;
      uint256 balanceToBefore = toToken.balanceOf(address(this));
      try router.swapExactTokensForTokens(amount, 0, path, address(this), block.timestamp * 2) {
          return toToken.balanceOf(address(this)).sub(balanceToBefore);
      } catch {
          return 0;
      }
  }
  
  function swapRouterPercentage(bytes memory routerAddressEncoded, bytes memory fromTokenAddressEncoded, bytes memory toTokenAddressEncoded, bytes memory percentageEncoded) public onlyOwner returns(bytes memory){
      uint256 percentage = execute(percentageEncoded).toUint256();
      require(percentage <= 100);
      address routerAddress = execute(routerAddressEncoded).toAddress();
      address fromTokenAddress = execute(fromTokenAddressEncoded).toAddress();
      address toTokenAddress = execute(toTokenAddressEncoded).toAddress();
      
      IERC20 fromToken = IERC20(fromTokenAddress);

      uint256 balance = fromToken.balanceOf(address(this));
      uint256 amount = balance.mul(percentage).div(100);
      
      return abi.encode(_swapRouter(routerAddress, fromTokenAddress, toTokenAddress, amount));
  }

  
  function swapRouterAmount(bytes memory routerAddressEncoded, bytes memory fromTokenAddressEncoded, bytes memory toTokenAddressEncoded, bytes memory amountEncoded) public onlyOwner returns(bytes memory){
      address routerAddress = execute(routerAddressEncoded).toAddress();
      address fromTokenAddress = execute(fromTokenAddressEncoded).toAddress();
      address toTokenAddress = execute(toTokenAddressEncoded).toAddress();
      uint256 amount = execute(amountEncoded).toUint256();
      
      return abi.encode(_swapRouter(routerAddress, fromTokenAddress, toTokenAddress, amount));
  }


  function pancakeCall(address sender, uint256 amount0, uint256 amount1, bytes calldata nextInfo) external {
      uniswapV2Call(sender, amount0, amount1, nextInfo);
  }
  
  function uniswapV2Call(address sender, uint256, uint256, bytes calldata nextInfo) public override {

      require(sender == address(this), "NIBC");
      FlashLoanRequestParams memory params = abi.decode(nextInfo, (FlashLoanRequestParams));
      
      require(msg.sender == params.pair, "IUP");
                  
      execute(params.callbackInstruction);
      
      uint256 amountOwing = params.amount.add(params.premium);
      uint256 currentBalance = IERC20(params.token).balanceOf(address(this));
      require(currentBalance >= amountOwing, "NETPBFS");
      IERC20(params.token).transfer(params.pair, amountOwing);
      
      
  }
  
  function _initiateFlashLoan(address routerAddress, address borrowedTokenAddress, address pairedTokenAddress, uint256 amount, bytes memory callbackInstruction)
      internal returns(bool) {
      IUniswapRouterV2 router = IUniswapRouterV2(routerAddress);
      IUniswapFactoryV2 factory = IUniswapFactoryV2(router.factory());
      IUniswapPairV2 pair = IUniswapPairV2(factory.getPair(borrowedTokenAddress, pairedTokenAddress));
      IERC20 borrowedToken = IERC20(borrowedTokenAddress);
      
      uint256 premium = amount.mul(35).div(10000);
         
      FlashLoanRequestParams memory params = FlashLoanRequestParams({
              
          token: borrowedTokenAddress,
                  amount: amount,           
                  premium: premium,
                  pair: address(pair),
                  callbackInstruction: callbackInstruction
                  });
      
      if(address(pair) == address(0)){
          revert('impossible loan');
      }
      uint256 amount0Out = 0;
      uint256 amount1Out = 0;
      if(pair.token0() == address(borrowedToken)){
          amount0Out = amount;
      } else {
          amount1Out = amount;
      }
      uint256 balanceBeforeSwap = borrowedToken.balanceOf(address(this));
      IUniswapPairV2(pair).swap(amount0Out, amount1Out, address(this), abi.encode(params));
      if(balanceBeforeSwap < borrowedToken.balanceOf(address(this))){
          return true;
      }
      return false;
  }
  
  function flashLoan(bytes memory routerAddressEncoded,
                     bytes memory borrowedTokenAddressEncoded,
                     bytes memory pairedTokenAddressEncoded,
                     bytes memory amountEncoded,
                     bytes memory callbackInstruction)
      public 
      returns(bytes memory){
      address routerAddress = execute(routerAddressEncoded).toAddress();
      address borrowedTokenAddress = execute(borrowedTokenAddressEncoded).toAddress();
      address pairedTokenAddress = execute(pairedTokenAddressEncoded).toAddress();
      uint256 amount = execute(amountEncoded).toUint256();

      return abi.encode(_initiateFlashLoan(routerAddress, borrowedTokenAddress, pairedTokenAddress, amount, callbackInstruction));
      
      
  }

  
}
