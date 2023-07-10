
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
  AaveV3EthereumUpdate20230710crvPayload
} from './AaveV3Update_20230710crv.sol';

contract AaveV3EthereumUpdate_20230710crv_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17665458);
  }

  function testEthereum20230710crvUpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230710crv',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.CRV_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3EthereumUpdate20230710crvPayload()),
      AaveGovernanceV2.SHORT_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230710crv',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230710crv', 'postTestEthereumUpdate20230710crv');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3EthereumAssets.CRV_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      CRV_UNDERLYINGBefore.borrowCap = 3800000;
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}