// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { Base } from "../Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";

contract MathUint256 is Base {
  using SafeMath for uint256;
  using BytesDecoder for bytes;
  function __version() override public pure returns(uint256) {
    return 1;
  }
  function max(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    if(an > bn){
      return abi.encode(an);
    }
    return abi.encode(bn);
  }
  function min(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    if(an < bn){
      return abi.encode(an);
    }
    return abi.encode(bn);
  }
  function gt(bytes memory a, bytes memory b) public  returns(bytes memory){
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an > bn);
  }
  function lt(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an < bn);
  }
  function gte(bytes memory a, bytes memory b) public  returns(bytes memory){
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an >= bn);
  }
  function lte(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an <= bn);
  }
  
  function eq(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an == bn);
  }
  function sub(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an.sub(bn));
  }
  function add(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an.add(bn));
  }
  function mul(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an.mul(bn));
  }
  function div(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an.div(bn));
  }
  function mod(bytes memory a, bytes memory b) public  returns(bytes memory) {
    uint256 an = execute(a).to_uint256();
    uint256 bn = execute(b).to_uint256();
    return abi.encode(an.mod(bn));
  }
}
