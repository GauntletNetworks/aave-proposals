// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IEngine,EngineFlags,Rates} from 'aave-helpers/v3-config-engine/AaveV3PayloadBase.sol';
import {
  AaveV3PayloadArbitrum,
  AaveV3ArbitrumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {
  AaveV3PayloadOptimism,
  AaveV3OptimismAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadOptimism.sol';
import {
  AaveV3PayloadPolygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';
import {
  AaveV3PayloadAvalanche,
  AaveV3AvalancheAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadAvalanche.sol';
import {
  AaveV3PayloadMetis,
  AaveV3MetisAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadMetis.sol';

contract AaveV3ArbitrumUpdate20230925Payload is AaveV3PayloadArbitrum {
  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsWETH_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: EngineFlags.KEEP_CURRENT,
      baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
      variableRateSlope1: _bpsToRay(330),
      variableRateSlope2: EngineFlags.KEEP_CURRENT,
      stableRateSlope1: EngineFlags.KEEP_CURRENT,
      stableRateSlope2: EngineFlags.KEEP_CURRENT,
      baseStableRateOffset: EngineFlags.KEEP_CURRENT,
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3ArbitrumAssets.WETH_UNDERLYING,
      params: paramsWETH_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}

contract AaveV3OptimismUpdate20230925Payload is AaveV3PayloadOptimism {
  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsWETH_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: EngineFlags.KEEP_CURRENT,
      baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
      variableRateSlope1: _bpsToRay(330),
      variableRateSlope2: EngineFlags.KEEP_CURRENT,
      stableRateSlope1: EngineFlags.KEEP_CURRENT,
      stableRateSlope2: EngineFlags.KEEP_CURRENT,
      baseStableRateOffset: EngineFlags.KEEP_CURRENT,
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3OptimismAssets.WETH_UNDERLYING,
      params: paramsWETH_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}

contract AaveV3PolygonUpdate20230925Payload is AaveV3PayloadPolygon {
  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsWETH_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: EngineFlags.KEEP_CURRENT,
      baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
      variableRateSlope1: _bpsToRay(330),
      variableRateSlope2: EngineFlags.KEEP_CURRENT,
      stableRateSlope1: EngineFlags.KEEP_CURRENT,
      stableRateSlope2: EngineFlags.KEEP_CURRENT,
      baseStableRateOffset: EngineFlags.KEEP_CURRENT,
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3PolygonAssets.WETH_UNDERLYING,
      params: paramsWETH_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}

contract AaveV3AvalancheUpdate20230925Payload is AaveV3PayloadAvalanche {
  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsWETHe_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: EngineFlags.KEEP_CURRENT,
      baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
      variableRateSlope1: _bpsToRay(330),
      variableRateSlope2: EngineFlags.KEEP_CURRENT,
      stableRateSlope1: EngineFlags.KEEP_CURRENT,
      stableRateSlope2: EngineFlags.KEEP_CURRENT,
      baseStableRateOffset: EngineFlags.KEEP_CURRENT,
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3AvalancheAssets.WETHe_UNDERLYING,
      params: paramsWETHe_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}

contract AaveV3MetisUpdate20230925Payload is AaveV3PayloadMetis {
  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsWETH_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: EngineFlags.KEEP_CURRENT,
      baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
      variableRateSlope1: _bpsToRay(330),
      variableRateSlope2: EngineFlags.KEEP_CURRENT,
      stableRateSlope1: EngineFlags.KEEP_CURRENT,
      stableRateSlope2: EngineFlags.KEEP_CURRENT,
      baseStableRateOffset: EngineFlags.KEEP_CURRENT,
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3MetisAssets.WETH_UNDERLYING,
      params: paramsWETH_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}