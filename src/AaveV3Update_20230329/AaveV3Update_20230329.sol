// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IEngine,EngineFlags,Rates} from 'aave-helpers/v3-config-engine/AaveV3PayloadBase.sol';
import {
  AaveV3PayloadArbitrum,
  AaveV3ArbitrumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {
  AaveV3PayloadEthereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {
  AaveV3PayloadPolygon,
  AaveV3PolygonAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadPolygon.sol';

contract AaveV3ArbitrumUpdate20230329Payload is AaveV3PayloadArbitrum {
  function capsUpdates() public pure override returns (IEngine.CapsUpdate[] memory) {
    IEngine.CapsUpdate[] memory capsUpdate = new IEngine.CapsUpdate[](1);

    capsUpdate[0] = IEngine.CapsUpdate({
      asset: AaveV3ArbitrumAssets.WETH_UNDERLYING,
      supplyCap: 45001,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
}

contract AaveV3EthereumUpdate20230329Payload is AaveV3PayloadEthereum {
  function capsUpdates() public pure override returns (IEngine.CapsUpdate[] memory) {
    IEngine.CapsUpdate[] memory capsUpdate = new IEngine.CapsUpdate[](2);

    capsUpdate[0] = IEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.rETH_UNDERLYING,
      supplyCap: 20001,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    capsUpdate[1] = IEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.CRV_UNDERLYING,
      supplyCap: 51000001,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
}

contract AaveV3PolygonUpdate20230329Payload is AaveV3PayloadPolygon {
  function collateralsUpdates() public pure override returns (IEngine.CollateralUpdate[] memory) {
    IEngine.CollateralUpdate[] memory collateralUpdates = new IEngine.CollateralUpdate[](1);

    collateralUpdates[0] = IEngine.CollateralUpdate({
      asset: AaveV3PolygonAssets.USDC_UNDERLYING,
      ltv: 8000,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT,
      eModeCategory: EngineFlags.KEEP_CURRENT
    });

    return collateralUpdates;
  }  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](1);

    Rates.RateStrategyParams memory paramsmiMATIC_UNDERLYING = Rates.RateStrategyParams({
      optimalUsageRatio: _bpsToRay(8000),
      baseVariableBorrowRate: _bpsToRay(100),
      variableRateSlope1: _bpsToRay(380),
      variableRateSlope2: _bpsToRay(8000),
      stableRateSlope1: _bpsToRay(400),
      stableRateSlope2: _bpsToRay(8000),
      baseStableRateOffset: _bpsToRay(300),
      stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
      optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
    });

    rateStrategyUpdates[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3PolygonAssets.miMATIC_UNDERLYING,
      params: paramsmiMATIC_UNDERLYING
    });

    return rateStrategyUpdates;
  }
}