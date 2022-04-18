// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";

import { Base } from "../Base.sol";

import { BytesDecoder } from "../libraries/BytesDecoder.sol";


contract ERC20 is Base {
  using SafeMath for uint256;
  function decimals(bytes memory tokenAddress)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token.decimals());
  }
  function name(bytes memory tokenAddress)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token.name());
  }
  function symbol(bytes memory tokenAddress)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token.symbol());
  }
  function totalSupply(bytes memory tokenAddress)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token.totalSupply());
  }
  function balanceOf(bytes memory tokenAddress, bytes memory accountAddress) public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token
                      .balanceOf(abi.decode(execute(accountAddress), (address))));
  }
  function allowance(bytes memory tokenAddress,
                     bytes memory ownerAddress,
                     bytes memory spenderAddress)
    public
    onlyOwner
    returns(bytes memory) {
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token
                      .allowance(abi.decode(execute(ownerAddress), (address)),
                                 abi.decode(execute(spenderAddress), (address))));
  }
  function transfer(bytes memory tokenAddress,
                    bytes memory recipient,
                    bytes memory amount)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    uint256 a = abi.decode(execute(amount), (uint256));
    require(token.balanceOf(address(this)) >= a);
    return abi.encode(token.transfer(
                                     abi.decode(execute(recipient), (address)),
                                     a));
  }
  function approve(bytes memory tokenAddress,
                   bytes memory spender,
                   bytes memory amount)
    public onlyOwner returns(bytes memory){
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    return abi.encode(token.approve(
                                    abi.decode(execute(spender), (address)),
                                    abi.decode(execute(amount), (uint256))
));
  }
  function transferFrom(bytes memory tokenAddress,
                        bytes memory senderAddress,
                        bytes memory recipient,
                        bytes memory amount)
    public onlyOwner returns(bytes memory) {
    IERC20Metadata token = IERC20Metadata(abi.decode(execute(tokenAddress), (address)));
    address sender = abi.decode(execute(senderAddress), (address));
    uint256 a = abi.decode(execute(amount), (uint256));
    require(token.balanceOf(sender) >= a
            && token.allowance(sender, address(this)) >= a);
    return abi.encode(token.transferFrom(sender,
                                         abi.decode(execute(recipient), (address)), a));
            
  }
}
