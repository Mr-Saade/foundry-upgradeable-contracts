// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "foundry-devops/DevOpsTools.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployedProxy = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2 boxV2 = new BoxV2();
        vm.stopBroadcast();
        address proxy = upgradeBox(mostRecentlyDeployedProxy, address(boxV2));
        return proxy;
    }

    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();

        BoxV1 proxy = BoxV1(proxyAddress);
        proxy.upgradeToAndCall(newBox, "");
        vm.stopBroadcast();
        return address(proxy);
    }
}
