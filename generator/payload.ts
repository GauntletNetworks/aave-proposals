import {
  AllUpdates,
  bpsToRayOrKeepCurrent,
  boolOrKeepCurrent,
  valueOrKeepCurrent,
  addressOrKeepCurrent,
  stringOrKeepCurrent,
  Networks,
  NetworkUpdate,
  KEEP_CURRENT,
} from './index.js';

export function generatePayloadFile(updateDate: string, updates: AllUpdates): string {
  const payloadFile = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {DataTypes} from 'aave-address-book/AaveV3.sol';
import {IPool,IPoolConfigurator} from 'aave-address-book/AaveV3.sol';
import {IEngine,EngineFlags,Rates} from 'aave-helpers/v3-config-engine/AaveV3PayloadBase.sol';
${Object.keys(updates)
  .map((network) => {
    return `import {
  AaveV3Payload${network},
  AaveV3${network}Assets
} from 'aave-helpers/v3-config-engine/AaveV3Payload${network}.sol';`;
  })
  .join('\n')}


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

${Object.keys(updates)
  .map((network) => {
    const update = updates[network as Networks] as NetworkUpdate;
    return `contract AaveV3${network}Update${updateDate}Payload is AaveV3Payload${network} {
${[
  `${
    update.capsUpdates && update.capsUpdates.length > 0
      ? `  function capsUpdates() public pure override returns (IEngine.CapsUpdate[] memory) {
    IEngine.CapsUpdate[] memory capsUpdate = new IEngine.CapsUpdate[](${update.capsUpdates.length});
${update.capsUpdates
  .map(
    (update, index) => `
    capsUpdate[${index}] = IEngine.CapsUpdate({
      asset: AaveV3${network}Assets.${update.asset},
      supplyCap: ${valueOrKeepCurrent(update.supplyCap)},
      borrowCap: ${valueOrKeepCurrent(update.borrowCap)}
    });`
  )
  .join('\n')}

    return capsUpdate;
  }`
      : ''
  }`,
  `${
    update.collateralUpdates && update.collateralUpdates.length > 0
      ? `  function collateralsUpdates() public pure override returns (IEngine.CollateralUpdate[] memory) {
    IEngine.CollateralUpdate[] memory collateralUpdates = new IEngine.CollateralUpdate[](${
      update.collateralUpdates.length
    });
${update.collateralUpdates
  .map(
    (update, index) => `
    collateralUpdates[${index}] = IEngine.CollateralUpdate({
      asset: AaveV3${network}Assets.${update.asset},
      ltv: ${valueOrKeepCurrent(update.ltv)},
      liqThreshold: ${valueOrKeepCurrent(update.liqThreshold)},
      liqBonus: ${valueOrKeepCurrent(update.liqBonus)},
      debtCeiling: ${valueOrKeepCurrent(update.debtCeiling)},
      liqProtocolFee: ${valueOrKeepCurrent(update.liqProtocolFee)},
      eModeCategory: ${valueOrKeepCurrent(update.eModeCategory)}
    });`
  )
  .join('\n')}

    return collateralUpdates;
  }`
      : ''
  }`,
  `${
    update.borrowUpdates && update.borrowUpdates.length > 0
      ? `  function borrowsUpdates() public pure override returns (IEngine.BorrowUpdate[] memory) {
    IEngine.BorrowUpdate[] memory borrowUpdates = new IEngine.BorrowUpdate[](${
      update.borrowUpdates.length
    });
${update.borrowUpdates
  .map(
    (update, index) => `
    borrowUpdates[${index}] = IEngine.BorrowUpdate({
      asset: AaveV3${network}Assets.${update.asset},
      enabledToBorrow: ${boolOrKeepCurrent(update.enabledToBorrow)},
      flashloanable: ${boolOrKeepCurrent(update.flashloanable)},
      stableRateModeEnabled: ${boolOrKeepCurrent(update.stableRateModeEnabled)},
      borrowableInIsolation: ${boolOrKeepCurrent(update.borrowableInIsolation)},
      withSiloedBorrowing: ${boolOrKeepCurrent(update.withSiloedBorrowing)},
      reserveFactor: ${valueOrKeepCurrent(update.reserveFactor)}
    });`
  )
  .join('\n')}

    return borrowUpdates;
  }`
      : ''
  }`,
  `${
    update.priceFeedUpdates && update.priceFeedUpdates.length > 0
      ? `  function priceFeedsUpdates() public pure override returns (IEngine.PriceFeedUpdate[] memory) {
    IEngine.PriceFeedUpdate[] memory priceFeedUpdates = new IEngine.PriceFeedUpdate[](${
      update.priceFeedUpdates.length
    });
${update.priceFeedUpdates
  .map(
    (update, index) => `
    priceFeedUpdates[${index}] = IEngine.PriceFeedUpdate({
      asset: AaveV3${network}Assets.${update.asset},
      priceFeed: ${update.priceFeed}
    });`
  )
  .join('\n')}

    return priceFeedUpdates;
  }`
      : ''
  }`,
  `${
    update.eModeUpdates && update.eModeUpdates.length > 0
      ? `  function _postExecute() internal override {
    EModeUpdate[] memory eModeUpdates = new EModeUpdate[](${update.eModeUpdates.length});
${update.eModeUpdates
  .map(
    (update, index) => `
    eModeUpdates[${index}] = EModeUpdate({
      eModeCategory: ${update.eModeCategory},
      ltv: ${valueOrKeepCurrent(update.ltv)},
      liqThreshold: ${valueOrKeepCurrent(update.liqThreshold)},
      liqBonus: ${valueOrKeepCurrent(update.liqBonus)},
      priceSource: ${
        update.priceSource === KEEP_CURRENT ? 'KEEP_CURRENT_ADDRESS' : update.priceSource
      },
      label: ${update.label === KEEP_CURRENT ? 'KEEP_CURRENT_STRING' : update.label}
    });`
  )
  .join('\n')}

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
  }`
      : ''
  }`,
  `${
    update.rateStrategyUpdates && update.rateStrategyUpdates.length > 0
      ? `  function rateStrategiesUpdates() public pure override returns (IEngine.RateStrategyUpdate[] memory) {
    IEngine.RateStrategyUpdate[] memory rateStrategyUpdates = new IEngine.RateStrategyUpdate[](${
      update.rateStrategyUpdates.length
    });
${update.rateStrategyUpdates
  .map(
    (update, index) => `
    Rates.RateStrategyParams memory params${update.asset} = Rates.RateStrategyParams({
      optimalUsageRatio: ${bpsToRayOrKeepCurrent(update.params.optimalUsageRatio)},
      baseVariableBorrowRate: ${bpsToRayOrKeepCurrent(update.params.baseVariableBorrowRate)},
      variableRateSlope1: ${bpsToRayOrKeepCurrent(update.params.variableRateSlope1)},
      variableRateSlope2: ${bpsToRayOrKeepCurrent(update.params.variableRateSlope2)},
      stableRateSlope1: ${bpsToRayOrKeepCurrent(update.params.stableRateSlope1)},
      stableRateSlope2: ${bpsToRayOrKeepCurrent(update.params.stableRateSlope2)},
      baseStableRateOffset: ${bpsToRayOrKeepCurrent(update.params.baseStableRateOffset)},
      stableRateExcessOffset: ${bpsToRayOrKeepCurrent(update.params.stableRateExcessOffset)},
      optimalStableToTotalDebtRatio: ${bpsToRayOrKeepCurrent(
        update.params.optimalStableToTotalDebtRatio
      )}
    });

    rateStrategyUpdates[${index}] = IEngine.RateStrategyUpdate({
      asset: AaveV3${network}Assets.${update.asset},
      params: params${update.asset}
    });`
  )
  .join('\n')}

    return rateStrategyUpdates;
  }`
      : ''
  }`,
]
  .filter((x) => x)
  .join('\n\n')}
}`;
  })
  .filter((x) => x)
  .join('\n\n')}`;

  return payloadFile;
}
