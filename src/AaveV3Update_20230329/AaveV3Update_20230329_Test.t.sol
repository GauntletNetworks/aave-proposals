
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
  AaveV3Ethereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {
  AaveV3Polygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';
import {
  AaveV3ArbitrumUpdate20230329Payload,
  AaveV3EthereumUpdate20230329Payload,
  AaveV3PolygonUpdate20230329Payload
} from './AaveV3Update_20230329.sol';

contract AaveV3ArbitrumUpdate_20230329_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 82691135);

    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testArbitrum20230329UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230329',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory WETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.WETH_UNDERLYING
    );

    _executePayload(address(new AaveV3ArbitrumUpdate20230329Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230329',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230329', 'postTestArbitrumUpdate20230329');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.WETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      WETH_UNDERLYINGBefore.supplyCap = 45001;
      _validateReserveConfig(WETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3EthereumUpdate_20230329_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17093012);

    _selectPayloadExecutor(AaveGovernanceV2.SHORT_EXECUTOR);
  }

  function testEthereum20230329UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230329',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory rETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.rETH_UNDERLYING
    );
    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.CRV_UNDERLYING
    );

    _executePayload(address(new AaveV3EthereumUpdate20230329Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230329',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230329', 'postTestEthereumUpdate20230329');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3EthereumAssets.rETH_UNDERLYING;
    assetsChanged[1] = AaveV3EthereumAssets.CRV_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      rETH_UNDERLYINGBefore.supplyCap = 20001;
      _validateReserveConfig(rETH_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      CRV_UNDERLYINGBefore.supplyCap = 51000001;
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230329_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 41776268);

    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPolygon20230329UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230329',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.USDC_UNDERLYING
    );
    ReserveConfig memory miMATIC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.miMATIC_UNDERLYING
    );

    _executePayload(address(new AaveV3PolygonUpdate20230329Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230329',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230329', 'postTestPolygonUpdate20230329');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3PolygonAssets.USDC_UNDERLYING;
    assetsChanged[1] = AaveV3PolygonAssets.miMATIC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      USDC_UNDERLYINGBefore.ltv = 8000;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory miMATIC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.miMATIC_UNDERLYING
      );
      miMATIC_UNDERLYINGBefore.interestRateStrategy = miMATIC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(miMATIC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}