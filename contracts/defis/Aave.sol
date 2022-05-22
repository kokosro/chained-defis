/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Base } from "../Base.sol";

import { BytesDecoder } from "../libraries/BytesDecoder.sol";

contract Aave is Base {
    using BytesDecoder for bytes;
    function __version() override public pure returns(uint256) {
        return 1;
    }
}
