// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBaseNFT} from "../script/DeployBaseNFT.s.sol";
import {BaseNFT} from "../src/BaseNFT.sol";

contract BaseNFTTest is Test {
    DeployBaseNFT public deployer;
    BaseNFT public baseNFT;
    address public USER = makeAddr("USER");
    string public constant TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBaseNFT();
        baseNFT = deployer.run();
    }

    function test_ShouldHaveNameDogie() public view {
        string memory expectedName = "Dogie";
        string memory actualName = baseNFT.name();
        // compare keccak256 hashes of strings encoded as bytes
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function test_ShoulMintNft() public {
        vm.prank(USER);
        baseNFT.mintNft(TOKEN_URI);

        assert(baseNFT.balanceOf(USER) == 1);
    }

    function test_ShouldHaveABalance_AfterMinting() public {
        vm.prank(USER);
        baseNFT.mintNft(TOKEN_URI);

        assert(baseNFT.balanceOf(USER) == 1);
    }

    function test_ShouldSetCorrectTokenUri_AfterMinting() public {
        vm.prank(USER);
        baseNFT.mintNft(TOKEN_URI);

        assert(
            keccak256(abi.encodePacked(baseNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(TOKEN_URI))
        );
    }
}
