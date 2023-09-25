
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
  AaveV3Metis,
  AaveV3MetisAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadMetis.sol';
import {
  AaveV3ArbitrumUpdate20230925Payload,
  AaveV3OptimismUpdate20230925Payload,
  AaveV3PolygonUpdate20230925Payload,
  AaveV3AvalancheUpdate20230925Payload,
  AaveV3MetisUpdate20230925Payload
} from './AaveV3Update_20230925.sol';

contract AaveV3ArbitrumUpdate_20230925_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 134586734);
  }

  function testArbitrum20230925UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230925',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory WETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.WETH_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3ArbitrumUpdate20230925Payload()),
      AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230925',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230925', 'postTestArbitrumUpdate20230925');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.WETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory WETH_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3ArbitrumAssets.WETH_UNDERLYING
      );
      WETH_UNDERLYINGBefore.interestRateStrategy = WETH_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230925_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 110040663);
  }

  function testOptimism20230925UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230925',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory WETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.WETH_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3OptimismUpdate20230925Payload()),
      AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230925',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230925', 'postTestOptimismUpdate20230925');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3OptimismAssets.WETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory WETH_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3OptimismAssets.WETH_UNDERLYING
      );
      WETH_UNDERLYINGBefore.interestRateStrategy = WETH_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230925_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 47982814);
  }

  function testPolygon20230925UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230925',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory WETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.WETH_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3PolygonUpdate20230925Payload()),
      AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230925',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230925', 'postTestPolygonUpdate20230925');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3PolygonAssets.WETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory WETH_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.WETH_UNDERLYING
      );
      WETH_UNDERLYINGBefore.interestRateStrategy = WETH_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3AvalancheUpdate_20230925_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 35657322);
  }

  function testAvalanche20230925UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230925',
      AaveV3Avalanche.POOL
    );

    ReserveConfig memory WETHe_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.WETHe_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3AvalancheUpdate20230925Payload()),
      0xa35b76E4935449E33C56aB24b23fcd3246f13470
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230925',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230925', 'postTestAvalancheUpdate20230925');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3AvalancheAssets.WETHe_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory WETHe_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3AvalancheAssets.WETHe_UNDERLYING
      );
      WETHe_UNDERLYINGBefore.interestRateStrategy = WETHe_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WETHe_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3MetisUpdate_20230925_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('metis'), 8735895);
  }

  function testMetis20230925UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestMetisUpdate20230925',
      AaveV3Metis.POOL
    );

    ReserveConfig memory WETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3MetisAssets.WETH_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3MetisUpdate20230925Payload()),
      AaveGovernanceV2.METIS_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestMetisUpdate20230925',
      AaveV3Metis.POOL
    );

    diffReports('preTestMetisUpdate20230925', 'postTestMetisUpdate20230925');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3MetisAssets.WETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory WETH_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3MetisAssets.WETH_UNDERLYING
      );
      WETH_UNDERLYINGBefore.interestRateStrategy = WETH_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}