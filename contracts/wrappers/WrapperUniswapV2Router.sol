/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface UniswapV2Router {

function WETH() external pure returns (address ) ;
function addLiquidity(address ,address ,uint256 ,uint256 ,uint256 ,uint256 ,address ,uint256 ) external  returns (uint256 ,uint256 ,uint256 ) ;
function addLiquidityETH(address ,uint256 ,uint256 ,uint256 ,address ,uint256 ) external payable returns (uint256 ,uint256 ,uint256 ) ;
function factory() external pure returns (address ) ;
function getAmountIn(uint256 ,uint256 ,uint256 ) external pure returns (uint256 ) ;
function getAmountOut(uint256 ,uint256 ,uint256 ) external pure returns (uint256 ) ;
function getAmountsIn(uint256 ,address[] memory ) external view returns (uint256[] memory ) ;
function getAmountsOut(uint256 ,address[] memory ) external view returns (uint256[] memory ) ;
function quote(uint256 ,uint256 ,uint256 ) external pure returns (uint256 ) ;
function removeLiquidity(address ,address ,uint256 ,uint256 ,uint256 ,address ,uint256 ) external  returns (uint256 ,uint256 ) ;
function removeLiquidityETH(address ,uint256 ,uint256 ,uint256 ,address ,uint256 ) external  returns (uint256 ,uint256 ) ;
function removeLiquidityETHSupportingFeeOnTransferTokens(address ,uint256 ,uint256 ,uint256 ,address ,uint256 ) external  returns (uint256 ) ;
function removeLiquidityETHWithPermit(address ,uint256 ,uint256 ,uint256 ,address ,uint256 ,bool ,uint8 ,bytes32 ,bytes32 ) external  returns (uint256 ,uint256 ) ;
function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(address ,uint256 ,uint256 ,uint256 ,address ,uint256 ,bool ,uint8 ,bytes32 ,bytes32 ) external  returns (uint256 ) ;
function removeLiquidityWithPermit(address ,address ,uint256 ,uint256 ,uint256 ,address ,uint256 ,bool ,uint8 ,bytes32 ,bytes32 ) external  returns (uint256 ,uint256 ) ;
function swapETHForExactTokens(uint256 ,address[] memory ,address ,uint256 ) external payable returns (uint256[] memory ) ;
function swapExactETHForTokens(uint256 ,address[] memory ,address ,uint256 ) external payable returns (uint256[] memory ) ;
function swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 ,address[] memory ,address ,uint256 ) external payable  ;
function swapExactTokensForETH(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external  returns (uint256[] memory ) ;
function swapExactTokensForETHSupportingFeeOnTransferTokens(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external   ;
function swapExactTokensForTokens(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external  returns (uint256[] memory ) ;
function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external   ;
function swapTokensForExactETH(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external  returns (uint256[] memory ) ;
function swapTokensForExactTokens(uint256 ,uint256 ,address[] memory ,address ,uint256 ) external  returns (uint256[] memory ) ;
}

contract Defi_UniswapV2Router is Base {




function WETH(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Router(contractAddress).WETH();
output = abi.encode(output0);
}

function addLiquidity(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6, bytes memory arg7) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
uint256 input4 = abi.decode(execute(arg4), (uint256));
uint256 input5 = abi.decode(execute(arg5), (uint256));
address input6 = abi.decode(execute(arg6), (address));
uint256 input7 = abi.decode(execute(arg7), (uint256));
(uint256 output0,uint256 output1,uint256 output2)= UniswapV2Router(contractAddress).addLiquidity(input0,input1,input2,input3,input4,input5,input6,input7);
output = abi.encode(output0,output1,output2);
}

function addLiquidityETH(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
address input4 = abi.decode(execute(arg4), (address));
uint256 input5 = abi.decode(execute(arg5), (uint256));
(uint256 output0,uint256 output1,uint256 output2)= UniswapV2Router(contractAddress).addLiquidityETH(input0,input1,input2,input3,input4,input5);
output = abi.encode(output0,output1,output2);
}

function factory(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= UniswapV2Router(contractAddress).factory();
output = abi.encode(output0);
}

function getAmountIn(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
(uint256 output0)= UniswapV2Router(contractAddress).getAmountIn(input0,input1,input2);
output = abi.encode(output0);
}

function getAmountOut(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
(uint256 output0)= UniswapV2Router(contractAddress).getAmountOut(input0,input1,input2);
output = abi.encode(output0);
}

function getAmountsIn(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
address[] memory input1 = abi.decode(execute(arg1), (address[]));
(uint256[] memory output0)= UniswapV2Router(contractAddress).getAmountsIn(input0,input1);
output = abi.encode(output0);
}

function getAmountsOut(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
address[] memory input1 = abi.decode(execute(arg1), (address[]));
(uint256[] memory output0)= UniswapV2Router(contractAddress).getAmountsOut(input0,input1);
output = abi.encode(output0);
}

function quote(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
(uint256 output0)= UniswapV2Router(contractAddress).quote(input0,input1,input2);
output = abi.encode(output0);
}

function removeLiquidity(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
uint256 input4 = abi.decode(execute(arg4), (uint256));
address input5 = abi.decode(execute(arg5), (address));
uint256 input6 = abi.decode(execute(arg6), (uint256));
(uint256 output0,uint256 output1)= UniswapV2Router(contractAddress).removeLiquidity(input0,input1,input2,input3,input4,input5,input6);
output = abi.encode(output0,output1);
}

function removeLiquidityETH(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
address input4 = abi.decode(execute(arg4), (address));
uint256 input5 = abi.decode(execute(arg5), (uint256));
(uint256 output0,uint256 output1)= UniswapV2Router(contractAddress).removeLiquidityETH(input0,input1,input2,input3,input4,input5);
output = abi.encode(output0,output1);
}

function removeLiquidityETHSupportingFeeOnTransferTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
address input4 = abi.decode(execute(arg4), (address));
uint256 input5 = abi.decode(execute(arg5), (uint256));
(uint256 output0)= UniswapV2Router(contractAddress).removeLiquidityETHSupportingFeeOnTransferTokens(input0,input1,input2,input3,input4,input5);
output = abi.encode(output0);
}

function removeLiquidityETHWithPermit(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6, bytes memory arg7, bytes memory arg8, bytes memory arg9) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
address input4 = abi.decode(execute(arg4), (address));
uint256 input5 = abi.decode(execute(arg5), (uint256));
bool input6 = abi.decode(execute(arg6), (bool));
uint8 input7 = abi.decode(execute(arg7), (uint8));
bytes32 input8 = abi.decode(execute(arg8), (bytes32));
bytes32 input9 = abi.decode(execute(arg9), (bytes32));
(uint256 output0,uint256 output1)= UniswapV2Router(contractAddress).removeLiquidityETHWithPermit(input0,input1,input2,input3,input4,input5,input6,input7,input8,input9);
output = abi.encode(output0,output1);
}

function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6, bytes memory arg7, bytes memory arg8, bytes memory arg9) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
address input4 = abi.decode(execute(arg4), (address));
uint256 input5 = abi.decode(execute(arg5), (uint256));
bool input6 = abi.decode(execute(arg6), (bool));
uint8 input7 = abi.decode(execute(arg7), (uint8));
bytes32 input8 = abi.decode(execute(arg8), (bytes32));
bytes32 input9 = abi.decode(execute(arg9), (bytes32));
(uint256 output0)= UniswapV2Router(contractAddress).removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(input0,input1,input2,input3,input4,input5,input6,input7,input8,input9);
output = abi.encode(output0);
}

function removeLiquidityWithPermit(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4, bytes memory arg5, bytes memory arg6, bytes memory arg7, bytes memory arg8, bytes memory arg9, bytes memory arg10) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
uint256 input3 = abi.decode(execute(arg3), (uint256));
uint256 input4 = abi.decode(execute(arg4), (uint256));
address input5 = abi.decode(execute(arg5), (address));
uint256 input6 = abi.decode(execute(arg6), (uint256));
bool input7 = abi.decode(execute(arg7), (bool));
uint8 input8 = abi.decode(execute(arg8), (uint8));
bytes32 input9 = abi.decode(execute(arg9), (bytes32));
bytes32 input10 = abi.decode(execute(arg10), (bytes32));
(uint256 output0,uint256 output1)= UniswapV2Router(contractAddress).removeLiquidityWithPermit(input0,input1,input2,input3,input4,input5,input6,input7,input8,input9,input10);
output = abi.encode(output0,output1);
}

function swapETHForExactTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
address[] memory input1 = abi.decode(execute(arg1), (address[]));
address input2 = abi.decode(execute(arg2), (address));
uint256 input3 = abi.decode(execute(arg3), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapETHForExactTokens(input0,input1,input2,input3);
output = abi.encode(output0);
}

function swapExactETHForTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
address[] memory input1 = abi.decode(execute(arg1), (address[]));
address input2 = abi.decode(execute(arg2), (address));
uint256 input3 = abi.decode(execute(arg3), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapExactETHForTokens(input0,input1,input2,input3);
output = abi.encode(output0);
}

function swapExactETHForTokensSupportingFeeOnTransferTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
address[] memory input1 = abi.decode(execute(arg1), (address[]));
address input2 = abi.decode(execute(arg2), (address));
uint256 input3 = abi.decode(execute(arg3), (uint256));
 UniswapV2Router(contractAddress).swapExactETHForTokensSupportingFeeOnTransferTokens(input0,input1,input2,input3);
output = abi.encode(true);
}

function swapExactTokensForETH(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapExactTokensForETH(input0,input1,input2,input3,input4);
output = abi.encode(output0);
}

function swapExactTokensForETHSupportingFeeOnTransferTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
 UniswapV2Router(contractAddress).swapExactTokensForETHSupportingFeeOnTransferTokens(input0,input1,input2,input3,input4);
output = abi.encode(true);
}

function swapExactTokensForTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapExactTokensForTokens(input0,input1,input2,input3,input4);
output = abi.encode(output0);
}

function swapExactTokensForTokensSupportingFeeOnTransferTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
 UniswapV2Router(contractAddress).swapExactTokensForTokensSupportingFeeOnTransferTokens(input0,input1,input2,input3,input4);
output = abi.encode(true);
}

function swapTokensForExactETH(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapTokensForExactETH(input0,input1,input2,input3,input4);
output = abi.encode(output0);
}

function swapTokensForExactTokens(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3, bytes memory arg4) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
address[] memory input2 = abi.decode(execute(arg2), (address[]));
address input3 = abi.decode(execute(arg3), (address));
uint256 input4 = abi.decode(execute(arg4), (uint256));
(uint256[] memory output0)= UniswapV2Router(contractAddress).swapTokensForExactTokens(input0,input1,input2,input3,input4);
output = abi.encode(output0);
}


}
