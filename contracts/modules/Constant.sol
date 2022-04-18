// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "../Base.sol";

contract Constant is Base {
  function value(bytes memory toReturn)
    public pure returns(bytes memory){
    return toReturn;
  }
  function selfAddress()
      public view returns(bytes memory) {
      return abi.encode(address(this));
  }
}
