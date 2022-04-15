// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Destroyable is Ownable {
  constructor(){
  }
  
  function __swipeToken(IERC20 token) public onlyOwner returns(bool) {
    try token.transfer(msg.sender, token.balanceOf(address(this))) {
      return true;
    } catch {
      return false;
    }
  }
  
  function destroy(IERC20[] calldata tokensToSwipe) public onlyOwner {
    for(uint256 i = 0; i < tokensToSwipe.length; i++){
      __swipeToken(tokensToSwipe[i]);
    }
    selfdestruct(payable(msg.sender));
  }
}
