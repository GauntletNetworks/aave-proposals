
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
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 92432492);

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