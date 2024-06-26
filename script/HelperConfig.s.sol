// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import { Script }         from "forge-std/Script.sol";
import { MockAggregator } from "@chainlink/contracts/mocks/MockAggregator.sol";
import { ERC20Mock }      from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    MockAggregator public AggMock;

    struct NetworkConfig {
        address wethUsdPriceFeed;
        address wbtcUsdPriceFeed;
        address weth;
        address wbtc;
        uint256 deployerKey;
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory anvilNetworkConfig) {
        if (activeNetworkConfig.wethUsdPriceFeed != address(0)) {
            return activeNetworkConfig;
        }

        //AggMock = MockAggregator(0x123);

        //AggMock.setLatestAnswer(2000e8);
        MockAggregator ethUsdPriceFeed = new MockAggregator();
        ERC20Mock wethMock = new ERC20Mock();

        //AggMock.setLatestAnswer(1000e8);
        MockAggregator btcUsdPriceFeed = new MockAggregator();
        ERC20Mock wbtcMock = new ERC20Mock();

        anvilNetworkConfig = NetworkConfig({
            wethUsdPriceFeed: address(ethUsdPriceFeed),
            weth: address(wethMock),
            wbtcUsdPriceFeed: address(btcUsdPriceFeed),
            wbtc: address(wbtcMock),
            deployerKey: 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
        });

        activeNetworkConfig = anvilNetworkConfig;
    }
}
