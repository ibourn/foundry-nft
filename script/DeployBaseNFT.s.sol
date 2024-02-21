// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BaseNFT} from "../src/BaseNFT.sol";

contract DeployBaseNFT is Script {
    function run() external returns (BaseNFT) {
        vm.startBroadcast();
        BaseNFT baseNFT = new BaseNFT();
        vm.stopBroadcast();
        return baseNFT;
    }
}
