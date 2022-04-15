// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
  mapping(bytes32=>bytes) public slot0;
  mapping(address=>mapping(uint256=>bool)) public writePriviledge;
  
  modifier hasWritePriviledge {
    require(writePriviledge[msg.sender][block.number]);
    _;
  }
  function slot0Value(bytes32 key) public view returns(bytes memory){
    return slot0[key];
  }
  function slot0KeyExists(bytes32 key) public view returns(bool){
    return slot0[key].length > 0;
  }
  function setSlot0Value(bytes32 key, bytes memory value) public hasWritePriviledge {
    _setSlot0(key, value);
  }
  function _setSlot0(bytes32 key, bytes memory value) internal {
    slot0[key] = value;
  }
  function _setWritePriviledge(address person) internal {
    writePriviledge[person][block.number] = true;
  }
  
}
