/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Storage } from "./Storage.sol";
import { Receiveable } from "./Receiveable.sol";
import { Operable } from "./Operable.sol";

contract Base is Storage, Receiveable, Operable {
  address private currentInstructionTarget;
  bytes4 private registeredCallback;
  address private registeredCallbackSender;
  uint256 private registeredCallbackBlock;
  enum InstructionType { SELF, EXTERNAL }
  
  struct Instruction {
    InstructionType _type;
    uint256 value;
    address target;
    string name;
    uint256 version;
    bytes data;
    bytes next;
  }

  function __version() virtual public pure returns(uint256){
    return 1;
  }
  
  function registerCallback(bytes4 sig, address sender) internal {
    registeredCallback = sig;
    registeredCallbackSender = sender;
    registeredCallbackBlock = block.number;
  }
  
  function unregisterCallback() internal {
    registeredCallback = bytes4(0);
    registeredCallbackSender = address(0);
    registeredCallbackBlock = 0;
  }
  
  function execute(bytes memory instructionInformation) public onlyOperator returns(bytes memory){
    
    if(instructionInformation.length == 0){
      return new bytes(0);
    }
       
    Instruction memory instruction = abi.decode(instructionInformation, (Instruction));
    bool success;
    bytes memory resultData;
    require(Base(payable(instruction.target)).__version() == instruction.version, "Invalid target version");
    
    currentInstructionTarget = instruction.target;
    
    if(instruction._type == InstructionType.SELF){
      _setWritePriviledge(address(this));
      (success, resultData) =
        instruction.target.delegatecall(instruction.data);
      require(success, string(abi.encodePacked(instruction.name," failed call 1")));
      currentInstructionTarget = address(0);
    } else if ( instruction._type == InstructionType.EXTERNAL ) {
      _setWritePriviledge(instruction.target);
      (success, resultData) = instruction.target.call{ value: instruction.value }(instruction.data);
      require(success, "failed execution 2");
      currentInstructionTarget = address(0);
    } else {
      revert("unknown instruction type");
    }
    if(instruction.next.length > 0){
      return execute(instruction.next);
    }
   
    return abi.decode(resultData, (bytes));
  }
  
  fallback() external payable {
    if(msg.sig == registeredCallback
       && msg.sender == registeredCallbackSender
       && block.number == registeredCallbackBlock){
      address cit = currentInstructionTarget;
      if(currentInstructionTarget != address(0)){
        unregisterCallback();
        assembly {
          // copy function selector and any arguments
          calldatacopy(0, 0, calldatasize())
           // execute function call using current executor
            let result := delegatecall(gas(), cit, 0, calldatasize(), 0, 0)
            // get any return value
            returndatacopy(0, 0, returndatasize())
            // return any return value or error back to the caller
            switch result
              case 0 {revert(0, returndatasize())}
          default {return (0, returndatasize())}
        }
      }
    }
  }
     
}
