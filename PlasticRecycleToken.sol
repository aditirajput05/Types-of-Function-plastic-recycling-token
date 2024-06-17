// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/access/Ownable.sol";

contract PlasticRecycleToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable() {
        transferOwnership(msg.sender);
    }

    // RecyclePlastic function restricted to contract owner
    function recyclePlastic(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // DiscardPlastic function to allow any user to destroy their tokens
    function discardPlastic(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Transfer function to log transfer details
    function transfer(address to, uint256 amount) public override returns (bool) {
        bool success = super.transfer(to, amount);
        if (success) {
            emit TransferDetails(msg.sender, to, amount, block.timestamp);
        }
        return success;
    }

    // TransferFrom function to log transfer details
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        bool success = super.transferFrom(from, to, amount);
        if (success) {
            emit TransferDetails(from, to, amount, block.timestamp);
        }
        return success;
    }

    // Event to log transfer details
    event TransferDetails(address indexed from, address indexed to, uint256 value, uint256 timestamp);
}
