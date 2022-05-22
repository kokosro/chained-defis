// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IYearnVault is IERC20 {
    function deposit(uint256 amount) external returns(uint256);
    function withdraw(uint256 shares) external returns(uint256);
    function pricePerShare() external view returns(uint256);
    function availableDepositLimit() external view returns(uint256);
    function apiVersion() external view returns(string memory);
    function totalAssets() external view returns(uint256);
    function maxAvailableShares() external view returns(uint256);
    function token() external view returns(address);
    function debtRatio() external view returns(uint256);
    function totalDebt() external view returns(uint256);
    function lastReport() external view returns(uint256);
    function lockedProfit() external view returns(uint256);
    function rewards() external view returns(address);
    function managementFee() external view returns(uint256);
    function performanceFee() external view returns(uint256);
    
}
