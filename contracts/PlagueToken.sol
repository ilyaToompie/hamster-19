// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PlagueToken is ERC20, Ownable {
  uint public constant REBATE_RATE = 5; // 5% rebate
  uint public infectionCount;

  constructor() ERC20("PlagueToken", "PLG") {
    _mint(msg.sender, 200 * 10 ** decimals()); 
    infectionCount = 0;
  }

  event Infection(address indexed wallet, string message);

  function _transfer(address sender, address recipient, uint256 amount) internal override{
    uint256 rebate = (amount * REBATE_RATE) / 100;
    uint256 amountAfterRebate = amount - rebate;

    super._transfer(sender, recipient, amountAfterRebate);
    infectionCount++;

    string memory message = string(abi.encodePacked("You've got infected! You are the", uint2str(infectionCount), "th infected in mainnet!"));
    emit Infection(recipient, message);

    _mint(sender, rebate);
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
