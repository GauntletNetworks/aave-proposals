
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
  AaveV3ArbitrumUpdate20230909Payload,
  AaveV3OptimismUpdate20230909Payload,
  AaveV3PolygonUpdate20230909Payload,
  AaveV3AvalancheUpdate20230909Payload
} from './AaveV3Update_20230909.sol';

contract AaveV3ArbitrumUpdate_20230909_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 129004371);
  }

  function testArbitrum20230909UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230909',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3ArbitrumUpdate20230909Payload()),
      AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230909',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230909', 'postTestArbitrumUpdate20230909');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.ltv = 0;
      MAI_UNDERLYINGBefore.isFrozen = true;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230909_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 109262843);
  }

  function testOptimism20230909UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230909',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3OptimismUpdate20230909Payload()),
      AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230909',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230909', 'postTestOptimismUpdate20230909');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3OptimismAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.ltv = 0;
      MAI_UNDERLYINGBefore.isFrozen = true;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230909_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 47269964);
  }

  function testPolygon20230909UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230909',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory miMATIC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.miMATIC_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3PolygonUpdate20230909Payload()),
      AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230909',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230909', 'postTestPolygonUpdate20230909');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3PolygonAssets.miMATIC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      miMATIC_UNDERLYINGBefore.ltv = 0;
      miMATIC_UNDERLYINGBefore.isFrozen = true;
      _validateReserveConfig(miMATIC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3AvalancheUpdate_20230909_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 34896498);
  }

  function testAvalanche20230909UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230909',
      AaveV3Avalanche.POOL
    );

    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.MAI_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3AvalancheUpdate20230909Payload()),
      0xa35b76E4935449E33C56aB24b23fcd3246f13470
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230909',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230909', 'postTestAvalancheUpdate20230909');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3AvalancheAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      MAI_UNDERLYINGBefore.ltv = 0;
      MAI_UNDERLYINGBefore.isFrozen = true;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}
