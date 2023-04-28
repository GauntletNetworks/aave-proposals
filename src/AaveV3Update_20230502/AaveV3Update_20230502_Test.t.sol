
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
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
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 84991019);

    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testArbitrum20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230502',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory USDT_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.USDT_UNDERLYING
    );
    ReserveConfig memory EURS_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.EURS_UNDERLYING
    );

    _executePayload(address(new AaveV3ArbitrumUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230502',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230502', 'postTestArbitrumUpdate20230502');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3ArbitrumAssets.USDT_UNDERLYING;
    assetsChanged[1] = AaveV3ArbitrumAssets.EURS_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      USDT_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(USDT_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      EURS_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(EURS_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 42037324);

    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPolygon20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230502',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory USDT_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.USDT_UNDERLYING
    );
    ReserveConfig memory EURS_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.EURS_UNDERLYING
    );
    ReserveConfig memory miMATIC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.miMATIC_UNDERLYING
    );
    ReserveConfig memory jEUR_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.jEUR_UNDERLYING
    );
    ReserveConfig memory agEUR_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.agEUR_UNDERLYING
    );

    _executePayload(address(new AaveV3PolygonUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230502',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230502', 'postTestPolygonUpdate20230502');

    address[] memory assetsChanged = new address[](5);
    assetsChanged[0] = AaveV3PolygonAssets.USDT_UNDERLYING;
    assetsChanged[1] = AaveV3PolygonAssets.EURS_UNDERLYING;
    assetsChanged[2] = AaveV3PolygonAssets.miMATIC_UNDERLYING;
    assetsChanged[3] = AaveV3PolygonAssets.jEUR_UNDERLYING;
    assetsChanged[4] = AaveV3PolygonAssets.agEUR_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      USDT_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(USDT_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      EURS_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(EURS_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      miMATIC_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(miMATIC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      jEUR_UNDERLYINGBefore.liquidationThreshold = 0;
      jEUR_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(jEUR_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      agEUR_UNDERLYINGBefore.liquidationThreshold = 0;
      agEUR_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(agEUR_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3AvalancheUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 29308324);

    _selectPayloadExecutor(0xa35b76E4935449E33C56aB24b23fcd3246f13470);
  }

  function testAvalanche20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230502',
      AaveV3Avalanche.POOL
    );

    ReserveConfig memory USDt_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.USDt_UNDERLYING
    );
    ReserveConfig memory MAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.MAI_UNDERLYING
    );

    _executePayload(address(new AaveV3AvalancheUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230502',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230502', 'postTestAvalancheUpdate20230502');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3AvalancheAssets.USDt_UNDERLYING;
    assetsChanged[1] = AaveV3AvalancheAssets.MAI_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      USDt_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(USDt_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      MAI_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(MAI_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230502_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 94864809);

    _selectPayloadExecutor(AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR);
  }

  function testOptimism20230502UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230502',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory USDT_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.USDT_UNDERLYING
    );
    ReserveConfig memory sUSD_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.sUSD_UNDERLYING
    );

    _executePayload(address(new AaveV3OptimismUpdate20230502Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230502',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230502', 'postTestOptimismUpdate20230502');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3OptimismAssets.USDT_UNDERLYING;
    assetsChanged[1] = AaveV3OptimismAssets.sUSD_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      USDT_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(USDT_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      sUSD_UNDERLYINGBefore.eModeCategory = 0;
      _validateReserveConfig(sUSD_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}