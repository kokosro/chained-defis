// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IUniswapFactoryV2 {
  event PairCreated(address indexed token0, address indexed token1, address pair, uint);
  
  function feeTo() external view returns (address);
  function feeToSetter() external view returns (address);

  function getPair(address tokenA, address tokenB) external view returns (address pair);
  function allPairs(uint) external view returns (address pair);
  function allPairsLength() external view returns (uint);
  
  function createPair(address tokenA, address tokenB) external returns (address pair);
  
  function setFeeTo(address) external;
  function setFeeToSetter(address) external;
}

interface IUniswapPairV2 is IERC20 {
  function MINIMUM_LIQUIDITY() external pure returns (uint);
  function factory() external view returns (address);
  function token0() external view returns (address);
  function token1() external view returns (address);
  function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
  function price0CumulativeLast() external view returns (uint);
  function price1CumulativeLast() external view returns (uint);
  function kLast() external view returns (uint);
  function mint(address to) external returns (uint liquidity);
  function burn(address to) external returns (uint amount0, uint amount1);
  function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
  function skim(address to) external;
  
}

interface IUniswapRouterV2 {
  function factory() external view returns (address);
  function WETH() external view returns (address);
  function addLiquidity(
                        address tokenA,
                        address tokenB,
                        uint amountADesired,
                        uint amountBDesired,
                        uint amountAMin,
                        uint amountBMin,
                        address to,
                        uint deadline
                        ) external
    returns (uint amountA, uint amountB, uint liquidity);
  
  function removeLiquidity(
                           address tokenA,
                           address tokenB,
                           uint liquidity,
                           uint amountAMin,
                           uint amountBMin,
                           address to,
                           uint deadline
                           ) external
    returns (uint amountA, uint amountB);
  
  function swapExactTokensForTokens(
                                    uint amountIn,
                                    uint amountOutMin,
                                    address[] calldata path,
                                    address to,
                                    uint deadline
                                    ) external
    returns (uint[] memory amounts);
  
  function swapTokensForExactTokens(
                                    uint amountOut,
                                    uint amountInMax,
                                    address[] calldata path,
                                    address to,
                                    uint deadline
                                    ) external
    returns (uint[] memory amounts);
  
  function quote(
                 uint amountA,
                 uint reserveA,
                 uint reserveB
                 ) external pure
    returns (uint amountB);
  
  function getAmountOut(
                        uint amountIn,
                        uint reserveIn,
                        uint reserveOut
                        ) external pure
    returns (uint amountOut);
  
  function getAmountIn(
                       uint amountOut,
                       uint reserveIn,
                       uint reserveOut
                       ) external pure
    returns (uint amountIn);
  
  function getAmountsOut(
                         uint amountIn,
                         address[] calldata path
                         ) external view
    returns (uint[] memory amounts);
  
  function getAmountsIn(
                        uint amountOut,
                        address[] calldata path
                        ) external view
    returns (uint[] memory amounts);
  
}

interface IUniswapV2Callee {
    function uniswapV2Call(address sender, uint256 amount0, uint256 amount1, bytes calldata data) external;
}
