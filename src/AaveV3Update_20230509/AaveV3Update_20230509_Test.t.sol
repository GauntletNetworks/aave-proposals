
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {TestWithExecutor} from 'aave-helpers/GovHelpers.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {
  AaveV3Ethereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {
  AaveV3EthereumUpdate20230509Payload
} from './AaveV3Update_20230509.sol';

contract AaveV3EthereumUpdate_20230509_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17093012);

    _selectPayloadExecutor(AaveGovernanceV2.SHORT_EXECUTOR);
  }

  function testEthereum20230509UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230509',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory LUSD_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.LUSD_UNDERLYING
    );

    _executePayload(address(new AaveV3EthereumUpdate20230509Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230509',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230509', 'postTestEthereumUpdate20230509');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3EthereumAssets.LUSD_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      LUSD_UNDERLYINGBefore.borrowCap = 4000000;
      _validateReserveConfig(LUSD_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}