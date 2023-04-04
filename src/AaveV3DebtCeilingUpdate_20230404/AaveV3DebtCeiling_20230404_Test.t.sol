// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import 'forge-std/Test.sol';

import {AaveV3Polygon, AaveV3PolygonAssets} from 'aave-address-book/AaveV3Polygon.sol';
import {AaveV3Arbitrum, AaveV3ArbitrumAssets} from 'aave-address-book/AaveV3Arbitrum.sol';
import {AaveV3Avalanche, AaveV3AvalancheAssets} from 'aave-address-book/AaveV3Avalanche.sol';
import {AaveV3PolDebtCeiling_20230404,AaveV3ArbDebtCeiling_20230404,AaveV3AvaDebtCeiling_20230404} from './AaveV3DebtCeiling_20230404.sol';
import {TestWithExecutor} from 'aave-helpers/GovHelpers.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {IACLManager} from 'aave-address-book/AaveV3.sol';

contract AaveV3PolDebtCeiling_20230404_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 41107564);
    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPayload() public {
    AaveV3PolDebtCeiling_20230404 proposalPayload = new AaveV3PolDebtCeiling_20230404();

    ReserveConfig[] memory allConfigsBefore = _getReservesConfigs(AaveV3Polygon.POOL);

    createConfigurationSnapshot('preAaveV3PolDebtCeiling_20230404_Change', AaveV3Polygon.POOL);

    _executePayload(address(proposalPayload));

    createConfigurationSnapshot('postAaveV3PolDebtCeiling_20230404_Change', AaveV3Polygon.POOL);

    ReserveConfig[] memory allConfigsAfter = _getReservesConfigs(AaveV3Polygon.POOL);

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3PolygonAssets.EURS_UNDERLYING;
    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    ReserveConfig memory eursBefore = ProtocolV3TestBase._findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.EURS_UNDERLYING
    );
    eursBefore.debtCeiling = 675_000_00;

    ProtocolV3TestBase._validateReserveConfig(eursBefore, allConfigsAfter);

    diffReports('preAaveV3PolDebtCeiling_20230404_Change', 'postAaveV3PolDebtCeiling_20230404_Change');
  }
}

contract AaveV3ArbDebtCeiling_20230404_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 76723370);
    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testPayload() public {
    AaveV3ArbDebtCeiling_20230404 proposalPayload = new AaveV3ArbDebtCeiling_20230404();

    ReserveConfig[] memory allConfigsBefore = _getReservesConfigs(AaveV3Arbitrum.POOL);

    createConfigurationSnapshot('preAaveV3ArbDebtCeiling_20230404_Change', AaveV3Arbitrum.POOL);

    _executePayload(address(proposalPayload));

    createConfigurationSnapshot('postAaveV3ArbDebtCeiling_20230404_Change', AaveV3Arbitrum.POOL);

    ReserveConfig[] memory allConfigsAfter = _getReservesConfigs(AaveV3Arbitrum.POOL);

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3ArbitrumAssets.USDT_UNDERLYING;
    assetsChanged[1] = AaveV3ArbitrumAssets.EURS_UNDERLYING;
    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    ReserveConfig memory eursBefore = ProtocolV3TestBase._findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.EURS_UNDERLYING
    );

    eursBefore.debtCeiling = 25_000_00;
    ProtocolV3TestBase._validateReserveConfig(eursBefore, allConfigsAfter);

    ReserveConfig memory usdtBefore = ProtocolV3TestBase._findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.USDT_UNDERLYING
    );

    usdtBefore.debtCeiling = 2_500_000_00;
    ProtocolV3TestBase._validateReserveConfig(usdtBefore, allConfigsAfter);

    diffReports('preAaveV3ArbDebtCeiling_20230404_Change', 'postAaveV3ArbDebtCeiling_20230404_Change');
  }
}

contract AaveV3AvaDebtCeiling_20230404_Test is ProtocolV3TestBase, TestWithExecutor {
  address public constant GUARDIAN_AVALANCHE =
      0xa35b76E4935449E33C56aB24b23fcd3246f13470;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 28282486);
    _selectPayloadExecutor(GUARDIAN_AVALANCHE);
  }

  function testPayload() public {
    ReserveConfig[] memory allConfigsBefore = _getReservesConfigs(AaveV3Avalanche.POOL);

    createConfigurationSnapshot('preAaveV3AvaDebtCeiling_20230404_Change', AaveV3Avalanche.POOL);

    AaveV3AvaDebtCeiling_20230404 proposalPayload = new AaveV3AvaDebtCeiling_20230404();

    _executePayload(address(proposalPayload));

    createConfigurationSnapshot('postAaveV3AvaDebtCeiling_20230404_Change', AaveV3Avalanche.POOL);

    ReserveConfig[] memory allConfigsAfter = _getReservesConfigs(AaveV3Avalanche.POOL);

    address[] memory assetsChanged = new address[](1);
    assetsChanged[0] = AaveV3AvalancheAssets.FRAX_UNDERLYING;
    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    ReserveConfig memory fraxBefore = ProtocolV3TestBase._findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.FRAX_UNDERLYING
    );

    fraxBefore.debtCeiling = 1_000_000_00;
    ProtocolV3TestBase._validateReserveConfig(fraxBefore, allConfigsAfter);

    diffReports('preAaveV3AvaDebtCeiling_20230404_Change', 'postAaveV3AvaDebtCeiling_20230404_Change');
  }
}
