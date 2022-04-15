// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import { IERC721Enumerable } from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import { IERC721Metadata } from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IcamERC20 is IERC20 {
  function leave(uint256) external;
  function Token() external view returns(address);
  function LENDING_POOL() external view returns(address);
  function AaveContract() external view returns(address);
  function enter(uint256) external;  
}

interface IMimaticVaultLiquidator {
  function liquidateVault(uint256) external;
  function getPaid() external;
}

interface IMimaticVaultHolder is IERC721, IERC721Enumerable, IERC721Metadata {
  function stabilityPool() external view returns(address);
  function getEthPriceSource() external view returns(uint256);
  function getTokenPriceSource() external view returns(uint256);
  function vaultDebt(uint256) external view returns(uint256);
  function vaultCollateral(uint256) external view returns(uint256);
  function collateral() external view returns(address);
  function _minimumCollateralPercentage() external view returns(uint256);
  function createVault() external returns(uint256);
  function destroyVault(uint256 vaultId) external ;
  function depositNative(uint256 vaultId) external payable;
  function depositCollateral(uint256 vaultId, uint256 amount) external;
  function withdrawCollateral(uint256 vaultId, uint256 amount, bool wrap) external;
  function checkLiquidation(uint256 vaultId) external view returns(bool);
  function checkCollateralPercentage(uint256 vaultId) external view returns(uint256);
  function getDebtCeiling() external view returns(uint256);
  function exists(uint256 vaultId) external view returns(bool);
  function getClosingFee() external view returns(uint256);
  function getOpeningFee() external view returns (uint256);
  function borrowToken(uint256 vaultId, uint256 amount) external;
  function payBackToken(uint256 vaultID, uint256 amount) external;
  function checkCost(uint256 vaultID) external view returns (uint256);
  function checkExtract(uint256 vaultID) external view returns (uint256);
  function vaultCount() external view returns(uint256);
  function closingFee() external view returns(uint256);
  function openingFee() external view returns(uint256);
  function treasury() external view returns(uint256);
  function tokenPeg() external view returns(uint256);
  function debtRatio() external view returns(uint256);
  function gainRatio() external view returns(uint256);
  function mai() external view returns(address);
  function priceSourceDecimals() external view returns(uint256);
  function totalBorrowed() external view returns(uint256);
  
}
