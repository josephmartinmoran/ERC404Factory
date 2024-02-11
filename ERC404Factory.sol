// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./ERC404.sol"; // Ensure this path is correct based on your project structure

contract ERC404Factory {
    // Array to store addresses of all created ERC404 tokens
    address[] private _createdTokens;

    // Event to log the creation of a new ERC404 token
    event ERC404Created(address indexed owner, address tokenAddress, string name, string symbol);

    // Function to create a new ERC404 token
    function createERC404Token(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 totalNativeSupply
    ) public {
        ERC404 newToken = new ERC404(name, symbol, decimals, totalNativeSupply, msg.sender);
        // Add the new token address to the array
        _createdTokens.push(address(newToken));
        // Emit an event with the new token details
        emit ERC404Created(msg.sender, address(newToken), name, symbol);
    }

    // Function to retrieve all ERC404 tokens created by this factory
    function getCreatedTokens() public view returns (address[] memory) {
        return _createdTokens;
    }
}
