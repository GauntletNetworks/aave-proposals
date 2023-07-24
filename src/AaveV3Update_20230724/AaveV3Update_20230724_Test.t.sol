
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
  AaveV3Ethereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {
  AaveV3ArbitrumUpdate20230724Payload,
  AaveV3EthereumUpdate20230724Payload,
  AaveV2EthereumUpdate20230724Payload
} from './AaveV3Update_20230724.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV2TestBase, ReserveConfig as V2ReserveConfig} from 'aave-helpers/ProtocolV2TestBase.sol';
import {AaveV2Ethereum, AaveV2EthereumAssets} from 'aave-address-book/AaveV2Ethereum.sol';

contract AaveV3ArbitrumUpdate_20230724_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 114584857);
  }

  function testArbitrum20230724UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230724',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory LINK_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.LINK_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3ArbitrumUpdate20230724Payload()),
      AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230724',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230724', 'postTestArbitrumUpdate20230724');

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3ArbitrumAssets.LINK_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      LINK_UNDERLYINGBefore.liquidationThreshold = 7750;
      _validateReserveConfig(LINK_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3EthereumUpdate_20230724_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17765584);
  }

  function testEthereum20230724UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230724',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory DAI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.DAI_UNDERLYING
    );
    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.USDC_UNDERLYING
    );
    ReserveConfig memory wstETH_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.wstETH_UNDERLYING
    );

    GovHelpers.executePayload(
      vm,
      address(new AaveV3EthereumUpdate20230724Payload()),
      AaveGovernanceV2.SHORT_EXECUTOR
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230724',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230724', 'postTestEthereumUpdate20230724');

    address[] memory assetsChanged = new address[](3);
    assetsChanged[0] = AaveV3EthereumAssets.DAI_UNDERLYING;
    assetsChanged[1] = AaveV3EthereumAssets.USDC_UNDERLYING;
    assetsChanged[2] = AaveV3EthereumAssets.wstETH_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      DAI_UNDERLYINGBefore.ltv = 7700;
      _validateReserveConfig(DAI_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      USDC_UNDERLYINGBefore.liquidationThreshold = 8000;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      wstETH_UNDERLYINGBefore.liquidationBonus = 10600;
      _validateReserveConfig(wstETH_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV2EthereumUpdate_20230724_Test is ProtocolV2TestBase {
  AaveV2EthereumUpdate20230724Payload public proposalPayload;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17765584);
  }

  function testPayload() public {
    V2ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAaveV2EthereumUpdates_20230724',
      AaveV2Ethereum.POOL
    );

    // 2. create payload
    proposalPayload = new AaveV2EthereumUpdate20230724Payload();

    // 3. execute payload
    GovHelpers.executePayload(vm, address(proposalPayload), AaveGovernanceV2.SHORT_EXECUTOR);

    V2ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAaveV2EthereumUpdates_20230724',
      AaveV2Ethereum.POOL
    );

    diffReports(
      'preTestAaveV2EthereumUpdates_20230724',
      'postTestAaveV2EthereumUpdates_20230724'
    );

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV2EthereumAssets.SNX_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);
  }
}
