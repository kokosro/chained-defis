/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface UniswapV2Factory {

function allPairs(uint256 ) external view returns (address ) ;
function allPairsLength() external view returns (uint256 ) ;
function createPair(address ,address ) external  returns (address ) ;
function feeTo() external view returns (address ) ;
function feeToSetter() external view returns (address ) ;
function getPair(address ,address ) external view returns (address ) ;
function setFeeTo(address ) external   ;
function setFeeToSetter(address ) external   ;
}

contract Defi_UniswapV2Factory is Base {




function allPairs(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(address output0)= UniswapV2Factory(contractAddress).allPairs(input0);
output = abi.encode(output0);
}

function allPairsLength(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Factory(contractAddress).allPairsLength();
output = abi.encode(output0);
}

function createPair(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
(address output0)= UniswapV2Factory(contractAddress).createPair(input0,input1);
output = abi.encode(output0);
}

function feeTo(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Factory(contractAddress).feeTo();
output = abi.encode(output0);
}

function feeToSetter(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Factory(contractAddress).feeToSetter();
output = abi.encode(output0);
}

function getPair(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
(address output0)= UniswapV2Factory(contractAddress).getPair(input0,input1);
output = abi.encode(output0);
}

function setFeeTo(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 UniswapV2Factory(contractAddress).setFeeTo(input0);
output = abi.encode(true);
}

function setFeeToSetter(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 UniswapV2Factory(contractAddress).setFeeToSetter(input0);
output = abi.encode(true);
}


}
