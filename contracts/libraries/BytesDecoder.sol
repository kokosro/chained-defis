// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BytesDecoder {
  function to_bytes(bytes memory b) internal pure returns(bytes memory) {
    return abi.decode(b, (bytes));
  }
  
  function to_uint8(bytes memory b) internal pure returns(uint8) {
    return abi.decode(b, (uint8));
  }

  function to_uint16(bytes memory b) internal pure returns(uint16) {
    return abi.decode(b, (uint16));
  }

  function to_uint32(bytes memory b) internal pure returns(uint32) {
    return abi.decode(b, (uint32));
  }

  function to_uint64(bytes memory b) internal pure returns(uint64) {
    return abi.decode(b, (uint64));
  }

  function to_uint128(bytes memory b) internal pure returns(uint128) {
    return abi.decode(b, (uint128));
  }
  
  function to_uint256(bytes memory b) internal pure returns(uint256) {
    return abi.decode(b, (uint256));
  }

  function to_int8(bytes memory b) internal pure returns(int8) {
    return abi.decode(b, (int8));
  }

  function to_int16(bytes memory b) internal pure returns(int16) {
    return abi.decode(b, (int16));
  }

  function to_int32(bytes memory b) internal pure returns(int32) {
    return abi.decode(b, (int32));
  }

  function to_int64(bytes memory b) internal pure returns(int64) {
    return abi.decode(b, (int64));
  }

  function to_int128(bytes memory b) internal pure returns(int128) {
    return abi.decode(b, (int128));
  }
  
  function to_int256(bytes memory b) internal pure returns(int256) {
    return abi.decode(b, (int256));
  }
  
  function to_bytes1(bytes memory b) internal pure returns(bytes1) {
      return abi.decode(b, (bytes1));
  }
  function to_bytes2(bytes memory b) internal pure returns(bytes2) {
      return abi.decode(b, (bytes2));
  }
  function to_bytes3(bytes memory b) internal pure returns(bytes3) {
      return abi.decode(b, (bytes3));
  }
  function to_bytes4(bytes memory b) internal pure returns(bytes4) {
      return abi.decode(b, (bytes4));
  }
  function to_bytes5(bytes memory b) internal pure returns(bytes5) {
      return abi.decode(b, (bytes5));
  }
  function to_bytes6(bytes memory b) internal pure returns(bytes6) {
      return abi.decode(b, (bytes6));
  }
  function to_bytes7(bytes memory b) internal pure returns(bytes7) {
      return abi.decode(b, (bytes7));
  }
  function to_bytes8(bytes memory b) internal pure returns(bytes8) {
      return abi.decode(b, (bytes8));
  }
  function to_bytes9(bytes memory b) internal pure returns(bytes9) {
      return abi.decode(b, (bytes9));
  }
  function to_bytes10(bytes memory b) internal pure returns(bytes10) {
      return abi.decode(b, (bytes10));
  }
  function to_bytes11(bytes memory b) internal pure returns(bytes11) {
      return abi.decode(b, (bytes11));
  }
  function to_bytes12(bytes memory b) internal pure returns(bytes12) {
      return abi.decode(b, (bytes12));
  }
  function to_bytes13(bytes memory b) internal pure returns(bytes13) {
      return abi.decode(b, (bytes13));
  }
  function to_bytes14(bytes memory b) internal pure returns(bytes14) {
      return abi.decode(b, (bytes14));
  }
  function to_bytes15(bytes memory b) internal pure returns(bytes15) {
      return abi.decode(b, (bytes15));
  }
  function to_bytes16(bytes memory b) internal pure returns(bytes16) {
      return abi.decode(b, (bytes16));
  }
  function to_bytes17(bytes memory b) internal pure returns(bytes17) {
      return abi.decode(b, (bytes17));
  }
  function to_bytes18(bytes memory b) internal pure returns(bytes18) {
      return abi.decode(b, (bytes18));
  }
  function to_bytes19(bytes memory b) internal pure returns(bytes19) {
      return abi.decode(b, (bytes19));
  }
  function to_bytes20(bytes memory b) internal pure returns(bytes20) {
      return abi.decode(b, (bytes20));
  }
  function to_bytes21(bytes memory b) internal pure returns(bytes21) {
      return abi.decode(b, (bytes21));
  }
  function to_bytes22(bytes memory b) internal pure returns(bytes22) {
      return abi.decode(b, (bytes22));
  }
  function to_bytes23(bytes memory b) internal pure returns(bytes23) {
      return abi.decode(b, (bytes23));
  }
  function to_bytes24(bytes memory b) internal pure returns(bytes24) {
      return abi.decode(b, (bytes24));
  }
  function to_bytes25(bytes memory b) internal pure returns(bytes25) {
      return abi.decode(b, (bytes25));
  }
  function to_bytes26(bytes memory b) internal pure returns(bytes26) {
      return abi.decode(b, (bytes26));
  }
  function to_bytes27(bytes memory b) internal pure returns(bytes27) {
      return abi.decode(b, (bytes27));
  }
  function to_bytes28(bytes memory b) internal pure returns(bytes28) {
      return abi.decode(b, (bytes28));
  }
  function to_bytes29(bytes memory b) internal pure returns(bytes29) {
      return abi.decode(b, (bytes29));
  }
  function to_bytes30(bytes memory b) internal pure returns(bytes30) {
      return abi.decode(b, (bytes30));
  }
  function to_bytes31(bytes memory b) internal pure returns(bytes31) {
      return abi.decode(b, (bytes31));
  }
  function to_bytes32(bytes memory b) internal pure returns(bytes32) {
      return abi.decode(b, (bytes32));
  }
  
  function to_bool(bytes memory b) internal pure returns(bool) {
    return abi.decode(b, (bool));
  }

  function to_address(bytes memory b) internal pure returns(address) {
    return abi.decode(b, (address));
  }

  function to_string(bytes memory b) internal pure returns(string memory){
      return abi.decode(b, (string));
  }
  
}
