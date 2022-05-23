/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Base } from "../Base.sol";
interface MimaticVault {

function _meta() external view returns (address ) ;
function _minimumCollateralPercentage() external view returns (uint256 ) ;
function approve(address ,uint256 ) external   ;
function balanceOf(address ) external view returns (uint256 ) ;
function base() external view returns (string memory ) ;
function baseURI() external view returns (string memory ) ;
function borrowToken(uint256 ,uint256 ) external   ;
function changeEthPriceSource(address ) external   ;
function checkCollateralPercentage(uint256 ) external view returns (uint256 ) ;
function checkCost(uint256 ) external view returns (uint256 ) ;
function checkExtract(uint256 ) external view returns (uint256 ) ;
function checkLiquidation(uint256 ) external view returns (bool ) ;
function closingFee() external view returns (uint256 ) ;
function collateral() external view returns (address ) ;
function collateralDecimals() external view returns (uint256 ) ;
function createVault() external  returns (uint256 ) ;
function debtRatio() external view returns (uint256 ) ;
function depositCollateral(uint256 ,uint256 ) external   ;
function destroyVault(uint256 ) external   ;
function ethPriceSource() external view returns (address ) ;
function exists(uint256 ) external view returns (bool ) ;
function gainRatio() external view returns (uint256 ) ;
function getApproved(uint256 ) external view returns (address ) ;
function getClosingFee() external view returns (uint256 ) ;
function getDebtCeiling() external view returns (uint256 ) ;
function getEthPriceSource() external view returns (uint256 ) ;
function getOpeningFee() external view returns (uint256 ) ;
function getPaid() external   ;
function getTokenPriceSource() external view returns (uint256 ) ;
function isApprovedForAll(address ,address ) external view returns (bool ) ;
function isOwner() external view returns (bool ) ;
function liquidateVault(uint256 ) external   ;
function mai() external view returns (address ) ;
function maticDebt(address ) external view returns (uint256 ) ;
function name() external view returns (string memory ) ;
function openingFee() external view returns (uint256 ) ;
function owner() external view returns (address ) ;
function ownerOf(uint256 ) external view returns (address ) ;
function payBackToken(uint256 ,uint256 ) external   ;
function renounceOwnership() external   ;
function safeTransferFrom(address ,address ,uint256 ) external   ;
function safeTransferFrom(address ,address ,uint256 ,bytes memory ) external   ;
function setApprovalForAll(address ,bool ) external   ;
function setBaseURI(string memory ) external   ;
function setClosingFee(uint256 ) external   ;
function setDebtRatio(uint256 ) external   ;
function setGainRatio(uint256 ) external   ;
function setMinCollateralRatio(uint256 ) external   ;
function setOpeningFee(uint256 ) external   ;
function setStabilityPool(address ) external   ;
function setTokenPeg(uint256 ) external   ;
function setTreasury(uint256 ) external   ;
function stabilityPool() external view returns (address ) ;
function supportsInterface(bytes4 ) external view returns (bool ) ;
function symbol() external view returns (string memory ) ;
function tokenByIndex(uint256 ) external view returns (uint256 ) ;
function tokenOfOwnerByIndex(address ,uint256 ) external view returns (uint256 ) ;
function tokenPeg() external view returns (uint256 ) ;
function tokenURI(uint256 ) external view returns (string memory ) ;
function totalSupply() external view returns (uint256 ) ;
function transferFrom(address ,address ,uint256 ) external   ;
function transferOwnership(address ) external   ;
function transferToken(uint256 ) external   ;
function transferToken(address ,address ,uint256 ) external   ;
function treasury() external view returns (uint256 ) ;
function vaultCollateral(uint256 ) external view returns (uint256 ) ;
function vaultCount() external view returns (uint256 ) ;
function vaultDebt(uint256 ) external view returns (uint256 ) ;
function withdrawCollateral(uint256 ,uint256 ) external   ;
}

contract Defi_MimaticVault is Base {




function _meta(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress)._meta();
output = abi.encode(output0);
}

function _minimumCollateralPercentage(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress)._minimumCollateralPercentage();
output = abi.encode(output0);
}

function approve(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
 MimaticVault(contractAddress).approve(input0,input1);
output = abi.encode(true);
}

function balanceOf(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= MimaticVault(contractAddress).balanceOf(input0);
output = abi.encode(output0);
}

function base(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= MimaticVault(contractAddress).base();
output = abi.encode(output0);
}

function baseURI(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= MimaticVault(contractAddress).baseURI();
output = abi.encode(output0);
}

function borrowToken(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
 MimaticVault(contractAddress).borrowToken(input0,input1);
output = abi.encode(true);
}

function changeEthPriceSource(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 MimaticVault(contractAddress).changeEthPriceSource(input0);
output = abi.encode(true);
}

function checkCollateralPercentage(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).checkCollateralPercentage(input0);
output = abi.encode(output0);
}

function checkCost(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).checkCost(input0);
output = abi.encode(output0);
}

function checkExtract(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).checkExtract(input0);
output = abi.encode(output0);
}

function checkLiquidation(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(bool output0)= MimaticVault(contractAddress).checkLiquidation(input0);
output = abi.encode(output0);
}

function closingFee(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).closingFee();
output = abi.encode(output0);
}

function collateral(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress).collateral();
output = abi.encode(output0);
}

function collateralDecimals(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).collateralDecimals();
output = abi.encode(output0);
}

function createVault(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).createVault();
output = abi.encode(output0);
}

function debtRatio(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).debtRatio();
output = abi.encode(output0);
}

function depositCollateral(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
 MimaticVault(contractAddress).depositCollateral(input0,input1);
output = abi.encode(true);
}

function destroyVault(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).destroyVault(input0);
output = abi.encode(true);
}

function ethPriceSource(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress).ethPriceSource();
output = abi.encode(output0);
}

function exists(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(bool output0)= MimaticVault(contractAddress).exists(input0);
output = abi.encode(output0);
}

function gainRatio(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).gainRatio();
output = abi.encode(output0);
}

function getApproved(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(address output0)= MimaticVault(contractAddress).getApproved(input0);
output = abi.encode(output0);
}

function getClosingFee(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).getClosingFee();
output = abi.encode(output0);
}

function getDebtCeiling(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).getDebtCeiling();
output = abi.encode(output0);
}

function getEthPriceSource(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).getEthPriceSource();
output = abi.encode(output0);
}

function getOpeningFee(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).getOpeningFee();
output = abi.encode(output0);
}

function getPaid(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

 MimaticVault(contractAddress).getPaid();
output = abi.encode(true);
}

function getTokenPriceSource(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).getTokenPriceSource();
output = abi.encode(output0);
}

function isApprovedForAll(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
(bool output0)= MimaticVault(contractAddress).isApprovedForAll(input0,input1);
output = abi.encode(output0);
}

function isOwner(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(bool output0)= MimaticVault(contractAddress).isOwner();
output = abi.encode(output0);
}

function liquidateVault(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).liquidateVault(input0);
output = abi.encode(true);
}

function mai(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress).mai();
output = abi.encode(output0);
}

function maticDebt(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
(uint256 output0)= MimaticVault(contractAddress).maticDebt(input0);
output = abi.encode(output0);
}

function name(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= MimaticVault(contractAddress).name();
output = abi.encode(output0);
}

function openingFee(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).openingFee();
output = abi.encode(output0);
}

function owner(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress).owner();
output = abi.encode(output0);
}

function ownerOf(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(address output0)= MimaticVault(contractAddress).ownerOf(input0);
output = abi.encode(output0);
}

function payBackToken(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
 MimaticVault(contractAddress).payBackToken(input0,input1);
output = abi.encode(true);
}

function renounceOwnership(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

 MimaticVault(contractAddress).renounceOwnership();
output = abi.encode(true);
}

function safeTransferFrom(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
 MimaticVault(contractAddress).safeTransferFrom(input0,input1,input2);
output = abi.encode(true);
}

function safeTransferFrom(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2, bytes memory arg3) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
bytes memory input3 = abi.decode(execute(arg3), (bytes));
 MimaticVault(contractAddress).safeTransferFrom(input0,input1,input2,input3);
output = abi.encode(true);
}

function setApprovalForAll(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
bool input1 = abi.decode(execute(arg1), (bool));
 MimaticVault(contractAddress).setApprovalForAll(input0,input1);
output = abi.encode(true);
}

function setBaseURI(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
string memory input0 = abi.decode(execute(arg0), (string));
 MimaticVault(contractAddress).setBaseURI(input0);
output = abi.encode(true);
}

function setClosingFee(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setClosingFee(input0);
output = abi.encode(true);
}

function setDebtRatio(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setDebtRatio(input0);
output = abi.encode(true);
}

function setGainRatio(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setGainRatio(input0);
output = abi.encode(true);
}

function setMinCollateralRatio(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setMinCollateralRatio(input0);
output = abi.encode(true);
}

function setOpeningFee(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setOpeningFee(input0);
output = abi.encode(true);
}

function setStabilityPool(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 MimaticVault(contractAddress).setStabilityPool(input0);
output = abi.encode(true);
}

function setTokenPeg(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setTokenPeg(input0);
output = abi.encode(true);
}

function setTreasury(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).setTreasury(input0);
output = abi.encode(true);
}

function stabilityPool(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(address output0)= MimaticVault(contractAddress).stabilityPool();
output = abi.encode(output0);
}

function supportsInterface(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
bytes4 input0 = abi.decode(execute(arg0), (bytes4));
(bool output0)= MimaticVault(contractAddress).supportsInterface(input0);
output = abi.encode(output0);
}

function symbol(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(string memory output0)= MimaticVault(contractAddress).symbol();
output = abi.encode(output0);
}

function tokenByIndex(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).tokenByIndex(input0);
output = abi.encode(output0);
}

function tokenOfOwnerByIndex(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
uint256 input1 = abi.decode(execute(arg1), (uint256));
(uint256 output0)= MimaticVault(contractAddress).tokenOfOwnerByIndex(input0,input1);
output = abi.encode(output0);
}

function tokenPeg(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).tokenPeg();
output = abi.encode(output0);
}

function tokenURI(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(string memory output0)= MimaticVault(contractAddress).tokenURI(input0);
output = abi.encode(output0);
}

function totalSupply(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).totalSupply();
output = abi.encode(output0);
}

function transferFrom(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
 MimaticVault(contractAddress).transferFrom(input0,input1,input2);
output = abi.encode(true);
}

function transferOwnership(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
 MimaticVault(contractAddress).transferOwnership(input0);
output = abi.encode(true);
}

function transferToken(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
 MimaticVault(contractAddress).transferToken(input0);
output = abi.encode(true);
}

function transferToken(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1, bytes memory arg2) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
address input0 = abi.decode(execute(arg0), (address));
address input1 = abi.decode(execute(arg1), (address));
uint256 input2 = abi.decode(execute(arg2), (uint256));
 MimaticVault(contractAddress).transferToken(input0,input1,input2);
output = abi.encode(true);
}

function treasury(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).treasury();
output = abi.encode(output0);
}

function vaultCollateral(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).vaultCollateral(input0);
output = abi.encode(output0);
}

function vaultCount(bytes memory _contractAddress) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));

(uint256 output0)= MimaticVault(contractAddress).vaultCount();
output = abi.encode(output0);
}

function vaultDebt(bytes memory _contractAddress, bytes memory arg0) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
(uint256 output0)= MimaticVault(contractAddress).vaultDebt(input0);
output = abi.encode(output0);
}

function withdrawCollateral(bytes memory _contractAddress, bytes memory arg0, bytes memory arg1) external returns(bytes memory output){
address contractAddress = abi.decode(execute(_contractAddress), (address));
uint256 input0 = abi.decode(execute(arg0), (uint256));
uint256 input1 = abi.decode(execute(arg1), (uint256));
 MimaticVault(contractAddress).withdrawCollateral(input0,input1);
output = abi.encode(true);
}


}
