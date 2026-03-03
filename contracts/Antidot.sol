// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HamsterAntidot is ERC20, Ownable {
  constructor() 
    ERC20("HamsterAntidot", "ANTI-HAMSTER") 
    Ownable(msg.sender)  {
    _mint(msg.sender, 200 * 10 ** decimals()); 
  }

  
}
