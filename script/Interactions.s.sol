// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BaseNFT} from "../src/BaseNFT.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

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

contract MintMoodNFT is Script {
    function run() external {
        address mostRecentlyDeployedMoodNFT = DevOpsTools
            .get_most_recent_deployment("MoodNFT", block.chainid);
        mintNFTOnContract(mostRecentlyDeployedMoodNFT);
    }

    function mintNFTOnContract(address moodNFTAddress) public {
        vm.startBroadcast();
        MoodNFT(moodNFTAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNFT is Script {
    uint256 public constant TOKEN_ID_TO_FLIP = 0;

    function run() external {
        address mostRecentlyDeployedMoodNFT = DevOpsTools
            .get_most_recent_deployment("MoodNFT", block.chainid);
        flipMoodNFT(mostRecentlyDeployedMoodNFT);
    }

    function flipMoodNFT(address moodNFTAddress) public {
        vm.startBroadcast();
        MoodNFT(moodNFTAddress).flipMood(TOKEN_ID_TO_FLIP);
        vm.stopBroadcast();
    }
}
