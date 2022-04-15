// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import { Base } from "./Base.sol";
import { BytesDecoder } from "../libraries/BytesDecoder.sol";

contract MathUint256 is Base {
  using SafeMath for uint256;
  using BytesDecoder for bytes;
  function max(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    if(an > bn){
      return abi.encode(an);
    }
    return abi.encode(bn);
  }
  function min(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    if(an < bn){
      return abi.encode(an);
    }
    return abi.encode(bn);
  }
  function gt(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory){
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an > bn);
  }
  function lt(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an < bn);
  }
  function gte(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory){
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an >= bn);
  }
  function lte(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an <= bn);
  }
  
  function eq(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an == bn);
  }
  function sub(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an.sub(bn));
  }
  function add(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an.add(bn));
  }
  function mul(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an.mul(bn));
  }
  function div(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an.div(bn));
  }
  function mod(bytes memory a, bytes memory b) public onlyOwner returns(bytes memory) {
    uint256 an = execute(a).toUint256();
    uint256 bn = execute(b).toUint256();
    return abi.encode(an.mod(bn));
  }
}
