// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Destroyable is Ownable {
  constructor(){
  }
  
  function destroy() public onlyOwner {
    selfdestruct(payable(msg.sender));
  }
}
