// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "./Base.sol";

contract Constant is ExecutorBase {
  function value(bytes memory toReturn)
    public pure returns(bytes memory){
    return toReturn;
  }
}
