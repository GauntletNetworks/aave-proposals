// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {DataTypes} from 'aave-address-book/AaveV3.sol';
import {IPool,IPoolConfigurator} from 'aave-address-book/AaveV3.sol';
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


/// @dev magic value to be used as flag to keep unchanged any current configuration
/// Strongly assumes that the value AaveV3ConfigEngine.EngineFlags.KEEP_CURRENT_STRING will never be used, which seems reasonable
string constant KEEP_CURRENT_STRING = 'AaveV3ConfigEngine.EngineFlags.KEEP_CURRENT_STRING';

/// @dev magic value to be used as flag to keep unchanged any current configuration
/// Strongly assumes that the value 0x00000000000000000000000000000000000042 will never be used, which seems reasonable
address constant KEEP_CURRENT_ADDRESS = address(0x00000000000000000000000000000000000042);

struct EModeUpdate {
  uint8 eModeCategory;
  uint256 ltv;
  uint256 liqThreshold;
  uint256 liqBonus;
  address priceSource;
  string label;
}

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
  }

  function _postExecute() internal override {
    EModeUpdate[] memory eModeUpdates = new EModeUpdate[](1);

    eModeUpdates[0] = EModeUpdate({
      eModeCategory: 1,
      ltv: 9740,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      priceSource: KEEP_CURRENT_ADDRESS,
      label: KEEP_CURRENT_STRING
    });

    for (uint256 i = 0; i < eModeUpdates.length; i++) {
      DataTypes.EModeCategory memory configuration = LISTING_ENGINE.POOL().getEModeCategoryData(eModeUpdates[i].eModeCategory);

      if (eModeUpdates[i].ltv == EngineFlags.KEEP_CURRENT) {
        eModeUpdates[i].ltv = configuration.ltv;
      }

      if (eModeUpdates[i].liqThreshold == EngineFlags.KEEP_CURRENT) {
        eModeUpdates[i].liqThreshold = configuration.liquidationThreshold;
      }

      if (eModeUpdates[i].liqBonus == EngineFlags.KEEP_CURRENT) {
        eModeUpdates[i].liqBonus = configuration.liquidationBonus;
      }

      if (eModeUpdates[i].priceSource == KEEP_CURRENT_ADDRESS) {
        eModeUpdates[i].priceSource = configuration.priceSource;
      }

      if (keccak256(abi.encode(eModeUpdates[i].label)) == keccak256(abi.encode(KEEP_CURRENT_STRING))) {
        eModeUpdates[i].label = configuration.label;
      }

      LISTING_ENGINE.POOL_CONFIGURATOR().setEModeCategory(
        eModeUpdates[i].eModeCategory,
        uint16(eModeUpdates[i].ltv),
        uint16(eModeUpdates[i].liqThreshold),
        uint16(eModeUpdates[i].liqBonus),
        eModeUpdates[i].priceSource,
        eModeUpdates[i].label
      );
    }
  }

  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
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