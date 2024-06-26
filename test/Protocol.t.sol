// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.23;

import {Test}              from "forge-std/Test.sol";
import {StdInvariant}      from "forge-std/StdInvariant.sol";
import {console}           from "forge-std/console.sol";
import { Deployer }        from "../script/deployer.sol";
import {HelperConfig }     from "../script/HelperConfig.s.sol";
import {EquiDime }         from "../src/EquiDime.sol";
import {CollateralActions} from "../src/CollateralActions.sol";
import {Liquidator }       from "../src/Liquidator.sol";
// import {MockAggregator }   from "@chainlink/contracts/mocks/MockAggregator.sol";
// import {ERC20Mock }        from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";
import {ReentrancyMock }   from "@openzeppelin/contracts/mocks/ReentrancyMock.sol";



contract Protocol is StdInvariant,Test {
    
    CollateralActions coll;
    Liquidator liq;
    EquiDime dsc;
    HelperConfig helperConfig;

    function setUp() public {
        Deployer deployer = new Deployer();
        (coll, liq, dsc , helperConfig) = deployer.run();
        //(ethUsdPriceFeed, btcUsdPriceFeed, weth, wbtc, deployerKey) = helperConfig.activeNetworkConfig();

    }

    function test_() public{
        
    }

    function invariant_() public{
        
    }
}