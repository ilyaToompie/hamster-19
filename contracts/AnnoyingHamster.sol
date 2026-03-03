// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AnnoyingHamster is ERC20, Ownable {
  uint public constant REBATE_RATE = 105; // 105% rebate
  uint public infectionCount;

  constructor() 
    ERC20("AnnoyingHamster", "HAMSTER") 
    Ownable(msg.sender)  {
    _mint(msg.sender, 2000 * 10 ** decimals()); 
  }

  event Infection(address indexed wallet, string message);
  function _update(address from, address to, uint256 value) internal override {
      if (from != address(0) && to != address(0)) {
          uint256 rebate = (value * REBATE_RATE) / 100;

          super._update(from, to, value);

          infectionCount++;

          string memory message = string(
              abi.encodePacked(
                  "You've got infected! You are the ",
                  uint2str(infectionCount),
                  "th infected in mainnet!"
              )
          );

          emit Infection(to, message);

          if (rebate > 0) {
              super._update(address(0), from, rebate);
          }
      } else {
          super._update(from, to, value);
      }
  }
    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
  
}
