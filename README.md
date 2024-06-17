# PlasticRecycleToken
This Solidity program provides functionality for creating and managing a plastic recycling token on the Ethereum blockchain.

## Description
The PlasticRecycleToken smart contract is an ERC20 token with additional features for minting and burning tokens. It includes owner-restricted minting and a burn function that allows users to destroy their tokens. The contract also logs transfer details with timestamps.

## Getting Started
This contract includes functions and events designed for minting, burning, and transferring tokens, along with an event to log transfer details.

### Prerequisites
An Ethereum development environment (e.g., Remix IDE)
A basic understanding of Solidity and smart contract development
### Installing
Open Remix IDE.
Create a new file with a .sol extension (e.g., PlasticRecycleToken.sol).
Copy and paste the provided code into the file.
### Code
```
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/access/Ownable.sol";

contract PlasticRecycleToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable() {
        transferOwnership(msg.sender);
    }

    // Produce tokens function restricted to contract owner
    function produceTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Recycle tokens function to allow any user to destroy their tokens
    function recycleTokens(uint256 amount) public {
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

    // Event to log transfer details
    event TransferDetails(address indexed from, address indexed to, uint256 value, uint256 timestamp);
}

```
## Compiling and Deploying
In Remix, navigate to the "Solidity Compiler" tab.
Ensure the compiler version is set to 0.8.20 (or another compatible version).
Click "Compile PlasticRecycleToken.sol".
After successful compilation, navigate to the "Deploy & Run Transactions" tab.
Select the PlasticRecycleToken contract from the dropdown menu.
Click "Deploy".
## Interacting with the Contract
Minting Tokens: Only the contract owner can mint tokens by calling the mint function.
Burning Tokens: Any user can burn their tokens by calling the burn function.
Transfer Logging: Each token transfer logs the details (sender, receiver, amount, and timestamp) using the TransferDetails event.
## Authors
Aditi Rajput
[@Chandigarh University](https://www.linkedin.com/in/aditi-rajput-b9360720b/)


## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
