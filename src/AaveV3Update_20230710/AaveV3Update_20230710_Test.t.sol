
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
  AaveV3Optimism,
  AaveV3OptimismAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadOptimism.sol';
import {
  AaveV3EthereumUpdate20230710Payload,
  AaveV3OptimismUpdate20230710Payload
} from './AaveV3Update_20230710.sol';

contract AaveV3EthereumUpdate_20230710_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17093012);
  }

  function testEthereum20230710UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230710',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory BAL_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.BAL_UNDERLYING
    );
    ReserveConfig memory LINK_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.LINK_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3EthereumUpdate20230710Payload()),
      AaveGovernanceV2.SHORT_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230710',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230710', 'postTestEthereumUpdate20230710');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3EthereumAssets.BAL_UNDERLYING;
    assetsChanged[1] = AaveV3EthereumAssets.LINK_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      BAL_UNDERLYINGBefore.supplyCap = 350000;
      _validateReserveConfig(BAL_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      LINK_UNDERLYINGBefore.supplyCap = 15000000;
      _validateReserveConfig(LINK_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230710_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 82691135);
  }

  function testOptimism20230710UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230710',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory OP_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.OP_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3OptimismUpdate20230710Payload()),
      AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230710',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230710', 'postTestOptimismUpdate20230710');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3OptimismAssets.OP_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      OP_UNDERLYINGBefore.supplyCap = 10000000;
      _validateReserveConfig(OP_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}