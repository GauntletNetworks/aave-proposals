
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import 'forge-std/interfaces/IERC20.sol';
import {TestWithExecutor} from 'aave-helpers/GovHelpers.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {
  AaveV3Arbitrum,
  AaveV3ArbitrumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {
  AaveV3Polygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';
import {
  AaveV3Avalanche,
  AaveV3AvalancheAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadAvalanche.sol';
import {
  AaveV3Optimism,
  AaveV3OptimismAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadOptimism.sol';
import {
  AaveV3ArbitrumUpdate20230502Payload,
  AaveV3PolygonUpdate20230502Payload,
  AaveV3AvalancheUpdate20230502Payload,
  AaveV3OptimismUpdate20230502Payload
} from './AaveV3Update_20230502.sol';

contract AaveV3ArbitrumUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 94107290);

    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testArbitrum20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230502',
      AaveV3Arbitrum.POOL
    );



    _executePayload(address(new AaveV3ArbitrumUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230502',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230502', 'postTestArbitrumUpdate20230502');

    address[] memory assetsChanged = new address[](0);


    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    // Address supplying DAI borrowing USDC with health factor below 1 after changes are applied
    // as of block 92432492
    address newlyUnhealthyAccount = 0xaCe9cB16fB8d47a8E383d0C9d13effFEF6Bb0dBC;

    // Large USDC account
    address liquidator = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;

    (
      uint256 preTotalCollateralBase,
      uint256 preTotalDebtBase,
      uint256 preAvailableBorrowsBase,
      uint256 preCurrentLiquidationThreshold,
      uint256 preLtv,
      uint256 preHealthFactor
    ) = AaveV3Arbitrum.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be below 1 before liquidation
    assertEq(preHealthFactor, 993455709009529270);
    assertEq(preTotalCollateralBase, 16418360028);
    assertEq(preTotalDebtBase, 15700188630);

    vm.startPrank(liquidator);

    IERC20(AaveV3ArbitrumAssets.USDC_UNDERLYING).approve(
      address(AaveV3Arbitrum.POOL),
      type(uint256).max
    );

    AaveV3Arbitrum.POOL.liquidationCall(
      AaveV3ArbitrumAssets.DAI_UNDERLYING,
      AaveV3ArbitrumAssets.USDC_UNDERLYING,
      newlyUnhealthyAccount,
      type(uint256).max,
      false
    );

    vm.stopPrank();

    (
      uint256 postTotalCollateralBase,
      uint256 postTotalDebtBase,
      uint256 postAvailableBorrowsBase,
      uint256 postCurrentLiquidationThreshold,
      uint256 postLtv,
      uint256 postHealthFactor
    ) = AaveV3Arbitrum.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be above 1 after liquidation
    assertEq(postHealthFactor, 1027411417922562883);
    assertEq(postTotalCollateralBase, 8489764769);
    assertEq(postTotalDebtBase, 7850094315);
  }
}

contract AaveV3PolygonUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 43109846);

    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPolygon20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230502',
      AaveV3Polygon.POOL
    );



    _executePayload(address(new AaveV3PolygonUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230502',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230502', 'postTestPolygonUpdate20230502');

    address[] memory assetsChanged = new address[](0);


    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    // Address supplying USDT borrowing DAI with health factor below 1 after changes are applied
    address newlyUnhealthyAccount = 0x70C03d5A839E3062dB05b58a3Cd71a9f6f4A040C;

    // Large DAI account
    address liquidator = 0xF977814e90dA44bFA03b6295A0616a897441aceC;

    (
      uint256 preTotalCollateralBase,
      uint256 preTotalDebtBase,
      uint256 preAvailableBorrowsBase,
      uint256 preCurrentLiquidationThreshold,
      uint256 preLtv,
      uint256 preHealthFactor
    ) = AaveV3Polygon.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be below 1 before liquidation
    assertEq(preHealthFactor, 985082090570824350);
    assertEq(preTotalCollateralBase, 3940018712);
    assertEq(preTotalDebtBase, 3799701377);

    vm.startPrank(liquidator);

    IERC20(AaveV3PolygonAssets.DAI_UNDERLYING).approve(
      address(AaveV3Polygon.POOL),
      type(uint256).max
    );

    AaveV3Polygon.POOL.liquidationCall(
      AaveV3PolygonAssets.USDT_UNDERLYING,
      AaveV3PolygonAssets.DAI_UNDERLYING,
      newlyUnhealthyAccount,
      type(uint256).max,
      false
    );

    vm.stopPrank();

    (
      uint256 postTotalCollateralBase,
      uint256 postTotalDebtBase,
      uint256 postAvailableBorrowsBase,
      uint256 postCurrentLiquidationThreshold,
      uint256 postLtv,
      uint256 postHealthFactor
    ) = AaveV3Polygon.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be above 1 after liquidation
    assertEq(postHealthFactor, 1010664181731738279);
    assertEq(postTotalCollateralBase, 2021169517);
    assertEq(postTotalDebtBase, 1899850688);
  }
}

contract AaveV3AvalancheUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 30453028);

    _selectPayloadExecutor(0xa35b76E4935449E33C56aB24b23fcd3246f13470);
  }

  function testAvalanche20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230502',
      AaveV3Avalanche.POOL
    );



    _executePayload(address(new AaveV3AvalancheUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230502',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230502', 'postTestAvalancheUpdate20230502');

    address[] memory assetsChanged = new address[](0);


    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    // Address supplying FRAX borrowing USDC with health factor below 1 after changes are applied
    address newlyUnhealthyAccount = 0x7E9226F4d9Cf7aEd64D24918477520a70D1b4820;

    // Large USDC account
    address liquidator = 0x9f8c163cBA728e99993ABe7495F06c0A3c8Ac8b9;

    (
      uint256 preTotalCollateralBase,
      uint256 preTotalDebtBase,
      uint256 preAvailableBorrowsBase,
      uint256 preCurrentLiquidationThreshold,
      uint256 preLtv,
      uint256 preHealthFactor
    ) = AaveV3Avalanche.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be below 1 before liquidation
    assertEq(preHealthFactor, 979188833688902781);
    assertEq(preTotalCollateralBase, 244247749227);
    assertEq(preTotalDebtBase, 236966919743);

    vm.startPrank(liquidator);

    IERC20(AaveV3AvalancheAssets.USDC_UNDERLYING).approve(
      address(AaveV3Avalanche.POOL),
      type(uint256).max
    );

    AaveV3Avalanche.POOL.liquidationCall(
      AaveV3AvalancheAssets.FRAX_UNDERLYING,
      AaveV3AvalancheAssets.USDC_UNDERLYING,
      newlyUnhealthyAccount,
      type(uint256).max,
      false
    );

    vm.stopPrank();

    (
      uint256 postTotalCollateralBase,
      uint256 postTotalDebtBase,
      uint256 postAvailableBorrowsBase,
      uint256 postCurrentLiquidationThreshold,
      uint256 postLtv,
      uint256 postHealthFactor
    ) = AaveV3Avalanche.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be raised after liquidation
    assertEq(postHealthFactor, 998877666552878652);
    assertEq(postTotalCollateralBase, 124579454706);
    assertEq(postTotalDebtBase, 118483459921);
  }
}

contract AaveV3OptimismUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 101210539);

    _selectPayloadExecutor(AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR);
  }

  function testOptimism20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230502',
      AaveV3Optimism.POOL
    );



    _executePayload(address(new AaveV3OptimismUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230502',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230502', 'postTestOptimismUpdate20230502');

    address[] memory assetsChanged = new address[](0);


    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    // Address supplying USDC borrowing DAI with health factor below 1 after changes are applied
    address newlyUnhealthyAccount = 0xa434187047120684940f946F367Ba9a16dB11b4c;

    // Large DAI account
    address liquidator = 0xbf16ef186e715668AA29ceF57e2fD7f9D48AdFE6;

    (
      uint256 preTotalCollateralBase,
      uint256 preTotalDebtBase,
      uint256 preAvailableBorrowsBase,
      uint256 preCurrentLiquidationThreshold,
      uint256 preLtv,
      uint256 preHealthFactor
    ) = AaveV3Optimism.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be below 1 before liquidation
    assertEq(preHealthFactor, 983799244341766822);
    assertEq(preTotalCollateralBase, 2675710441);
    assertEq(preTotalDebtBase, 2580248470);

    vm.startPrank(liquidator);

    IERC20(AaveV3OptimismAssets.DAI_UNDERLYING).approve(
      address(AaveV3Optimism.POOL),
      type(uint256).max
    );

    AaveV3Optimism.POOL.liquidationCall(
      AaveV3OptimismAssets.USDC_UNDERLYING,
      AaveV3OptimismAssets.DAI_UNDERLYING,
      newlyUnhealthyAccount,
      type(uint256).max,
      false
    );

    vm.stopPrank();

    (
      uint256 postTotalCollateralBase,
      uint256 postTotalDebtBase,
      uint256 postAvailableBorrowsBase,
      uint256 postCurrentLiquidationThreshold,
      uint256 postLtv,
      uint256 postHealthFactor
    ) = AaveV3Optimism.POOL.getUserAccountData(newlyUnhealthyAccount);

    // Health factor should be raised after liquidation
    assertEq(postHealthFactor, 1008134763858613973);
    assertEq(postTotalCollateralBase, 1372685056);
    assertEq(postTotalDebtBase, 1290124235);
  }
}
