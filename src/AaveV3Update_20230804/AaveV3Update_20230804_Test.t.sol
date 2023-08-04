
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  AaveV3Ethereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {
  AaveV3Polygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';
import {
  AaveV3EthereumUpdate20230804Payload,
  AaveV3PolygonUpdate20230804Payload
} from './AaveV3Update_20230804.sol';

contract AaveV3EthereumUpdate_20230804_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17844107);
  }

  function testEthereum20230804UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230804',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.CRV_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3EthereumUpdate20230804Payload()),
      AaveGovernanceV2.SHORT_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230804',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230804', 'postTestEthereumUpdate20230804');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3EthereumAssets.CRV_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      CRV_UNDERLYINGBefore.ltv = 3500;
      CRV_UNDERLYINGBefore.liquidationThreshold = 4100;
      CRV_UNDERLYINGBefore.debtCeiling = 5000000_00; // Ceiling specified in cents on chain
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230804_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 45912754);
  }

  function testPolygon20230804UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230804',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.CRV_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3PolygonUpdate20230804Payload()),
      AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230804',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230804', 'postTestPolygonUpdate20230804');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3PolygonAssets.CRV_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      CRV_UNDERLYINGBefore.ltv = 3500;
      CRV_UNDERLYINGBefore.liquidationThreshold = 6500;
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}
