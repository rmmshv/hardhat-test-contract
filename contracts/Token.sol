//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Token {
    string public name = "My Hardhat Token";
    string public symbol = "RHT";

    // fixed amount of tokens
    uint256 public totalSupply = 10000000;

    // address type var to store ethereum accounts
    address public owner;

    // key/value map where we store each account balance
    mapping(address => uint256) balances;

    /**
    * Contract initialization
    */

    constructor() {
        // the total supply is assigned to transaction sender that is deploying the contract
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    /**
    * A function to transfer tokens
    *
    * Functions with 'external modifier are only callable from 
    * outside the contract
    */

    function transfer(address to, uint256 amount) external {
        // check if sender has enough tokens
        // if required condition is false, transaction will revert
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // transfer the amount
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    /**
    * Read only functions to retrieve the token balance 
    * of a given account.
    *
    * Functions with 'view' modifier do not modify the contract 
    * and can be called without executing a transaction.
    */
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
