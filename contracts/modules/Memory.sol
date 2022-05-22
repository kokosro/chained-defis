/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";

contract Memory is Base {
    using BytesDecoder for bytes;
    function __version() override public pure returns(uint256) {
        return 1;
    }

    function setVar(bytes memory varName, bytes memory varValue) public returns(bytes memory) {
        bytes32 varKey = keccak256(execute(varName));
        _setSlot0(varKey, execute(varValue));
        return varValue;
    }
    function getVar(bytes memory varName) public returns(bytes memory) {
        bytes32 varKey = keccak256(execute(varName));
        return slot0Value(varKey);
    }
}
