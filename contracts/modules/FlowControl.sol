// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";

contract FlowControl is Base {
  using BytesDecoder for bytes;
  function __version() override public pure returns(uint256){
    return 1;
  }
  function _if(bytes memory conditionInstruction, bytes memory thenInstruction, bytes memory elseInstruction) public returns(bytes memory){
    bool conditionResponse = execute(conditionInstruction).toBool();
    if(conditionResponse) {
      return execute(thenInstruction);
    }
    return execute(elseInstruction);
  }

  function _halt(bytes memory reasonEncoded) public returns(bytes memory){
      string memory reason = execute(reasonEncoded).toString();
      revert(reason);
  }

} 
