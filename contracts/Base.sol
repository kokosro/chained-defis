/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Storage } from "./Storage.sol";
import { Receiveable } from "./Receiveable.sol";
import { Destroyable } from "./Destroyable.sol";

contract Base is Storage, Receiveable, Destroyable {
  address private currentExecutionTarget;
  bytes4 private registeredCallback;
  address private registeredCallbackSender;
  uint256 private registeredCallbackBlock;
  enum ExecutionType { SELF, EXTERNAL }
  
  struct Execution {
    ExecutionType _type;
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
  
  function execute(bytes memory executionInformation) public onlyOwner returns(bytes memory){
    if(executionInformation.length == 0){
      return new bytes(0);
    }
    Execution memory execution = abi.decode(executionInformation, (Execution));
    bool success;
    bytes memory resultData;
    require(Base(execution.target).__version() == execution.version, "Invalid target version");
    
    currentExecutionTarget = execution.target;
    
    if(execution._type == ExecutionType.SELF){
      _setWritePriviledge(address(this));
      (success, resultData) =
        execution.target.delegatecall(execution.data);
      require(success, string(abi.encodePacked(execution.name," failed call 1")));
      currentExecutionTarget = address(0);
    } else if ( execution._type == ExecutionType.EXTERNAL ) {
      _setWritePriviledge(execution.target);
      (success, resultData) = execution.target.call{ value: execution.value }(execution.data);
      require(success, "failed execution 2");
      currentExecutionTarget = address(0);
    } else {
      revert("unknown execution type");
    }
    if(execution.next.length > 0){
      return execute(execution.next);
    }
    
    return abi.decode(resultData, (bytes));
  }

  fallback() external payable {
    if(msg.sig == registeredCallback
       && msg.sender == registeredCallbackSender
       && block.number == registeredCallbackBlock){
      address cet = currentExecutionTarget;
      if(currentExecutionTarget != address(0)){
        unregisterCallback();
        assembly {
          // copy function selector and any arguments
          calldatacopy(0, 0, calldatasize())
            // execute function call using the facet
            let result := delegatecall(gas(), cet, 0, calldatasize(), 0, 0)
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
