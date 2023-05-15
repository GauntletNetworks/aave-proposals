
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
  AaveV3Optimism,
  AaveV3OptimismAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadOptimism.sol';
import {
  AaveV3Avalanche,
  AaveV3AvalancheAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadAvalanche.sol';
import {
  AaveV3ArbitrumUpdate20230510Payload,
  AaveV3EthereumUpdate20230510Payload,
  AaveV3PolygonUpdate20230510Payload,
  AaveV3OptimismUpdate20230510Payload,
  AaveV3AvalancheUpdate20230510Payload
} from './AaveV3Update_20230510.sol';

contract AaveV3ArbitrumUpdate_20230510_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 82691135);

    _selectPayloadExecutor(AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR);
  }

  function testArbitrum20230510UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestArbitrumUpdate20230510',
      AaveV3Arbitrum.POOL
    );

    ReserveConfig memory EURS_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.EURS_UNDERLYING
    );
    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.USDC_UNDERLYING
    );
    ReserveConfig memory WBTC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3ArbitrumAssets.WBTC_UNDERLYING
    );

    _executePayload(address(new AaveV3ArbitrumUpdate20230510Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestArbitrumUpdate20230510',
      AaveV3Arbitrum.POOL
    );

    diffReports('preTestArbitrumUpdate20230510', 'postTestArbitrumUpdate20230510');

    address[] memory assetsChanged = new address[](3);
    assetsChanged[0] = AaveV3ArbitrumAssets.EURS_UNDERLYING;
    assetsChanged[1] = AaveV3ArbitrumAssets.USDC_UNDERLYING;
    assetsChanged[2] = AaveV3ArbitrumAssets.WBTC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory EURS_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3ArbitrumAssets.EURS_UNDERLYING
      );
      EURS_UNDERLYINGBefore.interestRateStrategy = EURS_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(EURS_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory USDC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3ArbitrumAssets.USDC_UNDERLYING
      );
      USDC_UNDERLYINGBefore.interestRateStrategy = USDC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory WBTC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3ArbitrumAssets.WBTC_UNDERLYING
      );
      WBTC_UNDERLYINGBefore.interestRateStrategy = WBTC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WBTC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3EthereumUpdate_20230510_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 17093012);

    _selectPayloadExecutor(AaveGovernanceV2.SHORT_EXECUTOR);
  }

  function testEthereum20230510UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestEthereumUpdate20230510',
      AaveV3Ethereum.POOL
    );

    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.CRV_UNDERLYING
    );
    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.USDC_UNDERLYING
    );
    ReserveConfig memory USDT_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.USDT_UNDERLYING
    );
    ReserveConfig memory WBTC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3EthereumAssets.WBTC_UNDERLYING
    );

    _executePayload(address(new AaveV3EthereumUpdate20230510Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestEthereumUpdate20230510',
      AaveV3Ethereum.POOL
    );

    diffReports('preTestEthereumUpdate20230510', 'postTestEthereumUpdate20230510');

    address[] memory assetsChanged = new address[](4);
    assetsChanged[0] = AaveV3EthereumAssets.CRV_UNDERLYING;
    assetsChanged[1] = AaveV3EthereumAssets.USDC_UNDERLYING;
    assetsChanged[2] = AaveV3EthereumAssets.USDT_UNDERLYING;
    assetsChanged[3] = AaveV3EthereumAssets.WBTC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      CRV_UNDERLYINGBefore.reserveFactor = 3500;
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory USDC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3EthereumAssets.USDC_UNDERLYING
      );
      USDC_UNDERLYINGBefore.interestRateStrategy = USDC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory USDT_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3EthereumAssets.USDT_UNDERLYING
      );
      USDT_UNDERLYINGBefore.interestRateStrategy = USDT_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDT_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory WBTC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3EthereumAssets.WBTC_UNDERLYING
      );
      WBTC_UNDERLYINGBefore.interestRateStrategy = WBTC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WBTC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3PolygonUpdate_20230510_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 41776268);

    _selectPayloadExecutor(AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR);
  }

  function testPolygon20230510UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestPolygonUpdate20230510',
      AaveV3Polygon.POOL
    );

    ReserveConfig memory CRV_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.CRV_UNDERLYING
    );
    ReserveConfig memory DPI_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.DPI_UNDERLYING
    );
    ReserveConfig memory EURS_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.EURS_UNDERLYING
    );
    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.USDC_UNDERLYING
    );
    ReserveConfig memory WBTC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3PolygonAssets.WBTC_UNDERLYING
    );

    _executePayload(address(new AaveV3PolygonUpdate20230510Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestPolygonUpdate20230510',
      AaveV3Polygon.POOL
    );

    diffReports('preTestPolygonUpdate20230510', 'postTestPolygonUpdate20230510');

    address[] memory assetsChanged = new address[](5);
    assetsChanged[0] = AaveV3PolygonAssets.CRV_UNDERLYING;
    assetsChanged[1] = AaveV3PolygonAssets.DPI_UNDERLYING;
    assetsChanged[2] = AaveV3PolygonAssets.EURS_UNDERLYING;
    assetsChanged[3] = AaveV3PolygonAssets.USDC_UNDERLYING;
    assetsChanged[4] = AaveV3PolygonAssets.WBTC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      CRV_UNDERLYINGBefore.reserveFactor = 3500;
      _validateReserveConfig(CRV_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory DPI_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.DPI_UNDERLYING
      );
      DPI_UNDERLYINGBefore.interestRateStrategy = DPI_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(DPI_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory EURS_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.EURS_UNDERLYING
      );
      EURS_UNDERLYINGBefore.interestRateStrategy = EURS_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(EURS_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory USDC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.USDC_UNDERLYING
      );
      USDC_UNDERLYINGBefore.interestRateStrategy = USDC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory WBTC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3PolygonAssets.WBTC_UNDERLYING
      );
      WBTC_UNDERLYINGBefore.interestRateStrategy = WBTC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WBTC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3OptimismUpdate_20230510_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('optimism'), 97539765);

    _selectPayloadExecutor(AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR);
  }

  function testOptimism20230510UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestOptimismUpdate20230510',
      AaveV3Optimism.POOL
    );

    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.USDC_UNDERLYING
    );
    ReserveConfig memory WBTC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3OptimismAssets.WBTC_UNDERLYING
    );

    _executePayload(address(new AaveV3OptimismUpdate20230510Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestOptimismUpdate20230510',
      AaveV3Optimism.POOL
    );

    diffReports('preTestOptimismUpdate20230510', 'postTestOptimismUpdate20230510');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3OptimismAssets.USDC_UNDERLYING;
    assetsChanged[1] = AaveV3OptimismAssets.WBTC_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory USDC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3OptimismAssets.USDC_UNDERLYING
      );
      USDC_UNDERLYINGBefore.interestRateStrategy = USDC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory WBTC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3OptimismAssets.WBTC_UNDERLYING
      );
      WBTC_UNDERLYINGBefore.interestRateStrategy = WBTC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WBTC_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}

contract AaveV3AvalancheUpdate_20230510_Test is ProtocolV3TestBase, TestWithExecutor {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 29902181);

    _selectPayloadExecutor(0xa35b76E4935449E33C56aB24b23fcd3246f13470);
  }

  function testAvalanche20230510UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTestAvalancheUpdate20230510',
      AaveV3Avalanche.POOL
    );

    ReserveConfig memory USDC_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.USDC_UNDERLYING
    );
    ReserveConfig memory WBTCe_UNDERLYINGBefore = _findReserveConfig(
      allConfigsBefore,
      AaveV3AvalancheAssets.WBTCe_UNDERLYING
    );

    _executePayload(address(new AaveV3AvalancheUpdate20230510Payload()));

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTestAvalancheUpdate20230510',
      AaveV3Avalanche.POOL
    );

    diffReports('preTestAvalancheUpdate20230510', 'postTestAvalancheUpdate20230510');

    address[] memory assetsChanged = new address[](2);
    assetsChanged[0] = AaveV3AvalancheAssets.USDC_UNDERLYING;
    assetsChanged[1] = AaveV3AvalancheAssets.WBTCe_UNDERLYING;

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    {
      ReserveConfig memory USDC_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3AvalancheAssets.USDC_UNDERLYING
      );
      USDC_UNDERLYINGBefore.interestRateStrategy = USDC_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(USDC_UNDERLYINGBefore, allConfigsAfter);
    }
    {
      ReserveConfig memory WBTCe_UNDERLYINGAfter = _findReserveConfig(
        allConfigsAfter,
        AaveV3AvalancheAssets.WBTCe_UNDERLYING
      );
      WBTCe_UNDERLYINGBefore.interestRateStrategy = WBTCe_UNDERLYINGAfter.interestRateStrategy;
      _validateReserveConfig(WBTCe_UNDERLYINGBefore, allConfigsAfter);
    }
  }
}