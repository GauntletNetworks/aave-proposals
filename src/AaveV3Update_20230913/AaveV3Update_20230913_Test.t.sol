
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  AaveV3Arbitrum,
  AaveV3ArbitrumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {
  AaveV3Optimism,
  AaveV3OptimismAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadOptimism.sol';
import {
  AaveV3Polygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';
import {
  AaveV3Avalanche,
  AaveV3AvalancheAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadAvalanche.sol';
import {
  AaveV3ArbitrumUpdate20230913Payload,
  AaveV3OptimismUpdate20230913Payload,
  AaveV3PolygonUpdate20230913Payload,
  AaveV3AvalancheUpdate20230913Payload
} from './AaveV3Update_20230913.sol';

contract AaveV3ArbitrumUpdate_20230913_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 130813044);
  }

  function testArbitrum20230913UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230913',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3ArbitrumUpdate20230913Payload()),
      AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230913',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230913', 'postTestArbitrumUpdate20230913');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.debtCeiling = 0;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230913_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 109518280);
  }

  function testOptimism20230913UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230913',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3OptimismUpdate20230913Payload()),
      AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230913',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230913', 'postTestOptimismUpdate20230913');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3OptimismAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.debtCeiling = 0;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230913_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 47501942);
  }

  function testPolygon20230913UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230913',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory miMATIC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.miMATIC_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3PolygonUpdate20230913Payload()),
      AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230913',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230913', 'postTestPolygonUpdate20230913');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3PolygonAssets.miMATIC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      miMATIC_UNDERLYINGBefore.debtCeiling = 0;
      _validateReserveConfig(miMATIC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3AvalancheUpdate_20230913_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 35146117);
  }

  function testAvalanche20230913UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230913',
      AaveV3Avalanche.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3AvalancheUpdate20230913Payload()),
      0xa35b76E4935449E33C56aB24b23fcd3246f13470
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230913',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230913', 'postTestAvalancheUpdate20230913');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3AvalancheAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.debtCeiling = 0;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}