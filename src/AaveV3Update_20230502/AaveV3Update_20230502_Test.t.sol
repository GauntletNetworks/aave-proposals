
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
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 94452670);

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
    assertEq(preHealthFactor, 993347944093530487);
    assertEq(preTotalCollateralBase, 16419876479);
    assertEq(preTotalDebtBase, 15703342165);

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
    assertEq(postHealthFactor, 1027195888336372876);
    assertEq(postTotalCollateralBase, 8489688686);
    assertEq(postTotalDebtBase, 7851671082);
  }
}

contract AaveV3PolygonUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 42914128);

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


  }
}

contract AaveV3AvalancheUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 30240937);

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


  }
}

contract AaveV3OptimismUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 99835340);

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


  }
}
