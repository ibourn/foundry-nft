// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BaseNFT} from "../src/BaseNFT.sol";

contract MintBaseNFT is Script {
    string public constant TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() external {
        address mostRectenlyDeployedBaseNFT = DevOpsTools
            .get_most_recent_deployment("BaseNFT", block.chainid);
        mintNFTOnContract(mostRectenlyDeployedBaseNFT);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        BaseNFT(contractAddress).mintNft(TOKEN_URI);
        vm.stopBroadcast();
    }
}
