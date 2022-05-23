/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface UniswapV2Pair {

function DOMAIN_SEPARATOR() external view returns (bytes32 ) ;
function MINIMUM_LIQUIDITY() external pure returns (uint256 ) ;
function PERMIT_TYPEHASH() external pure returns (bytes32 ) ;
function allowance(address ,address ) external view returns (uint256 ) ;
function approve(address ,uint256 ) external  returns (bool ) ;
function balanceOf(address ) external view returns (uint256 ) ;
function burn(address ) external  returns (uint256 ,uint256 ) ;
function decimals() external pure returns (uint8 ) ;
function factory() external view returns (address ) ;
function getReserves() external view returns (uint112 ,uint112 ,uint32 ) ;
function initialize(address ,address ) external   ;
function kLast() external view returns (uint256 ) ;
function mint(address ) external  returns (uint256 ) ;
function name() external pure returns (string memory ) ;
function nonces(address ) external view returns (uint256 ) ;
function permit(address ,address ,uint256 ,uint256 ,uint8 ,bytes32 ,bytes32 ) external   ;
function price0CumulativeLast() external view returns (uint256 ) ;
function price1CumulativeLast() external view returns (uint256 ) ;
function skim(address ) external   ;
function swap(uint256 ,uint256 ,address ,bytes memory ) external   ;
function symbol() external pure returns (string memory ) ;
function sync() external   ;
function token0() external view returns (address ) ;
function token1() external view returns (address ) ;
function totalSupply() external view returns (uint256 ) ;
function transfer(address ,uint256 ) external  returns (bool ) ;
function transferFrom(address ,address ,uint256 ) external  returns (bool ) ;
}

contract Defi_UniswapV2Pair is Base {




function DOMAIN_SEPARATOR(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(bytes32 output0)= UniswapV2Pair(contractAddress).DOMAIN_SEPARATOR();
output = abi.encode(output0);
}

function MINIMUM_LIQUIDITY(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Pair(contractAddress).MINIMUM_LIQUIDITY();
output = abi.encode(output0);
}

function PERMIT_TYPEHASH(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(bytes32 output0)= UniswapV2Pair(contractAddress).PERMIT_TYPEHASH();
output = abi.encode(output0);
}

function allowance(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
(uint256 output0)= UniswapV2Pair(contractAddress).allowance(input0,input1);
output = abi.encode(output0);
}

function approve(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
(bool output0)= UniswapV2Pair(contractAddress).approve(input0,input1);
output = abi.encode(output0);
}

function balanceOf(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= UniswapV2Pair(contractAddress).balanceOf(input0);
output = abi.encode(output0);
}

function burn(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0,uint256 output1)= UniswapV2Pair(contractAddress).burn(input0);
output = abi.encode(output0,output1);
}

function decimals(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint8 output0)= UniswapV2Pair(contractAddress).decimals();
output = abi.encode(output0);
}

function factory(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Pair(contractAddress).factory();
output = abi.encode(output0);
}

function getReserves(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint112 output0,uint112 output1,uint32 output2)= UniswapV2Pair(contractAddress).getReserves();
output = abi.encode(output0,output1,output2);
}

function initialize(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
 UniswapV2Pair(contractAddress).initialize(input0,input1);
output = abi.encode(true);
}

function kLast(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Pair(contractAddress).kLast();
output = abi.encode(output0);
}

function mint(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= UniswapV2Pair(contractAddress).mint(input0);
output = abi.encode(output0);
}

function name(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= UniswapV2Pair(contractAddress).name();
output = abi.encode(output0);
}

function nonces(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= UniswapV2Pair(contractAddress).nonces(input0);
output = abi.encode(output0);
}

function permit(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
uint8 input4 = abi.decode(execute(arg4), (uint8));
bytes32 input5 = abi.decode(execute(arg5), (bytes32));
bytes32 input6 = abi.decode(execute(arg6), (bytes32));
 UniswapV2Pair(contractAddress).permit(input0,input1,input2,input3,input4,input5,input6);
output = abi.encode(true);
}

function price0CumulativeLast(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Pair(contractAddress).price0CumulativeLast();
output = abi.encode(output0);
}

function price1CumulativeLast(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Pair(contractAddress).price1CumulativeLast();
output = abi.encode(output0);
}

function skim(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 UniswapV2Pair(contractAddress).skim(input0);
output = abi.encode(true);
}

function swap(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address input2 = abi.decode(execute(arg2), (address));
bytes memory input3 = abi.decode(execute(arg3), (bytes));
 UniswapV2Pair(contractAddress).swap(input0,input1,input2,input3);
output = abi.encode(true);
}

function symbol(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= UniswapV2Pair(contractAddress).symbol();
output = abi.encode(output0);
}

function sync(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

 UniswapV2Pair(contractAddress).sync();
output = abi.encode(true);
}

function token0(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Pair(contractAddress).token0();
output = abi.encode(output0);
}

function token1(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Pair(contractAddress).token1();
output = abi.encode(output0);
}

function totalSupply(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= UniswapV2Pair(contractAddress).totalSupply();
output = abi.encode(output0);
}

function transfer(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
(bool output0)= UniswapV2Pair(contractAddress).transfer(input0,input1);
output = abi.encode(output0);
}

function transferFrom(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
(bool output0)= UniswapV2Pair(contractAddress).transferFrom(input0,input1,input2);
output = abi.encode(output0);
}


}
