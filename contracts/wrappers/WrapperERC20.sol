/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface ERC20 {

function name() external view returns (string memory ) ;
function approve(address ,uint256 ) external  returns (bool ) ;
function totalSupply() external view returns (uint256 ) ;
function transferFrom(address ,address ,uint256 ) external  returns (bool ) ;
function decimals() external view returns (uint8 ) ;
function balanceOf(address ) external view returns (uint256 ) ;
function symbol() external view returns (string memory ) ;
function transfer(address ,uint256 ) external  returns (bool ) ;
function allowance(address ,address ) external view returns (uint256 ) ;
}

contract Defi_ERC20 is Base {




function name(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= ERC20(contractAddress).name();
output = abi.encode(output0);
}

function approve(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
(bool output0)= ERC20(contractAddress).approve(input0,input1);
output = abi.encode(output0);
}

function totalSupply(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= ERC20(contractAddress).totalSupply();
output = abi.encode(output0);
}

function transferFrom(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
(bool output0)= ERC20(contractAddress).transferFrom(input0,input1,input2);
output = abi.encode(output0);
}

function decimals(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint8 output0)= ERC20(contractAddress).decimals();
output = abi.encode(output0);
}

function balanceOf(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= ERC20(contractAddress).balanceOf(input0);
output = abi.encode(output0);
}

function symbol(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= ERC20(contractAddress).symbol();
output = abi.encode(output0);
}

function transfer(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
(bool output0)= ERC20(contractAddress).transfer(input0,input1);
output = abi.encode(output0);
}

function allowance(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
(uint256 output0)= ERC20(contractAddress).allowance(input0,input1);
output = abi.encode(output0);
}


}
