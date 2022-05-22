/// SPDX-License-Identifier: MITT
pragma solidity ^0.8.0;

import { EnumerableMap } from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

import { Destroyable } from "./Destroyable.sol";

contract Operable is Destroyable {
    using EnumerableMap for EnumerableMap.UintToAddressMap;
    EnumerableMap.UintToAddressMap _operators;

    modifier onlyOperator() {
        require(_operators.contains(uint256(uint160(address(msg.sender)))), "Only operator");
        _;
    }
    
    function isOperator(address operator) external view returns(bool){
        return _operators.contains(uint256(uint160(address(operator))));
    }
    function addOperator(address operator) external onlyOwner {
        _operators.set(uint256(uint160(address(operator))), operator);
    }
    function removeOperator(address operator) external onlyOwner {
        _operators
            .remove(uint256(uint160(address(operator))));
    }
    function getOperators() external view returns(address[] memory){
        uint256 numberOfOperators = _operators.length();
        address[] memory addresses = new address[](numberOfOperators);

        
        for(uint256 i = 0; i < numberOfOperators; i++){
            (,addresses[i]) = _operators.at(i);
        }
        return addresses;
    }

}
