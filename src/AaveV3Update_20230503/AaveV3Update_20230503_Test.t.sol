
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
  AaveV3ArbitrumUpdate20230503Payload
} from './AaveV3Update_20230503.sol';

contract AaveV3ArbitrumUpdate_20230503_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 86975143);

    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testArbitrum20230503UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230503',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory EURS_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.EURS_UNDERLYING
    );

    _executePayload(address(new AaveV3ArbitrumUpdate20230503Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230503',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230503', 'postTestArbitrumUpdate20230503');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.EURS_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      EURS_UNDERLYINGBefore.supplyCap = 65000;
      EURS_UNDERLYINGBefore.borrowCap = 65000;
      _validateReserveConfig(EURS_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}