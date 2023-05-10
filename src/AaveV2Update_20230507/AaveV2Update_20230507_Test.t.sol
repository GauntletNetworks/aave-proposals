
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {TestWithExecutor} from 'aave-helpers/GovHelpers.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV2TestBase,ReserveConfig} from 'aave-helpers/ProtocolV2TestBase.sol';
import {AaveV2Avalanche,AaveV2AvalancheAssets} from 'aave-address-book/AaveV2Avalanche.sol';
import {AaveV2Ethereum,AaveV2EthereumAssets} from 'aave-address-book/AaveV2Ethereum.sol';
import {AaveV2Polygon,AaveV2PolygonAssets} from 'aave-address-book/AaveV2Polygon.sol';
import {
  AaveV2EthereumUpdate20230507Payload,
  AaveV2PolygonUpdate20230507Payload,
  AaveV2AvalancheUpdate20230507Payload
} from './AaveV2Update_20230507.sol';

contract AaveV2EthereumUpdate_20230507_Test is ProtocolV2TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17219285);

    _selectPayloadExecutor(AaveGovernanceV2.SHORT_EXECUTOR);
  }

  function testEthereum20230507UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230507',
      AaveV2Ethereum.POOL
    );

    _executePayload(address(new AaveV2EthereumUpdate20230507Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230507',
      AaveV2Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230507', 'postTestEthereumUpdate20230507');

    address[] memory assetsChanged = new address[](5);
    assetsChanged[0] = AaveV2EthereumAssets.FRAX_UNDERLYING;
    assetsChanged[1] = AaveV2EthereumAssets.GUSD_UNDERLYING;
    assetsChanged[2] = AaveV2EthereumAssets.USDP_UNDERLYING;
    assetsChanged[3] = AaveV2EthereumAssets.USDT_UNDERLYING;
    assetsChanged[4] = AaveV2EthereumAssets.WBTC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);
  }
}

contract AaveV2PolygonUpdate_20230507_Test is ProtocolV2TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 42473242);

    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPolygon20230507UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230507',
      AaveV2Polygon.POOL
    );

    _executePayload(address(new AaveV2PolygonUpdate20230507Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230507',
      AaveV2Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230507', 'postTestPolygonUpdate20230507');

    address[] memory assetsChanged = new address[](4);
    assetsChanged[0] = AaveV2PolygonAssets.USDT_UNDERLYING;
    assetsChanged[1] = AaveV2PolygonAssets.WBTC_UNDERLYING;
    assetsChanged[2] = AaveV2PolygonAssets.WETH_UNDERLYING;
    assetsChanged[3] = AaveV2PolygonAssets.WMATIC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);
  }
}

contract AaveV2AvalancheUpdate_20230507_Test is ProtocolV2TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 29774515);

    _selectPayloadExecutor(0xa35b76E4935449E33C56aB24b23fcd3246f13470);
  }

  function testAvalanche20230507UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230507',
      AaveV2Avalanche.POOL
    );

    _executePayload(address(new AaveV2AvalancheUpdate20230507Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230507',
      AaveV2Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230507', 'postTestAvalancheUpdate20230507');

    address[] memory assetsChanged = new address[](3);
    assetsChanged[0] = AaveV2AvalancheAssets.USDTe_UNDERLYING;
    assetsChanged[1] = AaveV2AvalancheAssets.WAVAX_UNDERLYING;
    assetsChanged[2] = AaveV2AvalancheAssets.WETHe_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);
  }
}
