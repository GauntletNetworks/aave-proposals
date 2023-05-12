import {
  AllUpdates,
  EngineValue,
  KEEP_CURRENT,
  NetworkUpdate,
  RateStrategyUpdate,
} from '../generator/index.js';

function partialRateUpdate(
  update: Partial<RateStrategyUpdate['params']>
): RateStrategyUpdate['params'] {
  function keepCurrentIfUndefined<T>(x: T | undefined): EngineValue<T> {
    return x === undefined ? KEEP_CURRENT : x;
  }

  return {
    optimalUsageRatio: keepCurrentIfUndefined(update.optimalUsageRatio),
    baseVariableBorrowRate: keepCurrentIfUndefined(update.baseVariableBorrowRate),
    variableRateSlope1: keepCurrentIfUndefined(update.variableRateSlope1),
    variableRateSlope2: keepCurrentIfUndefined(update.variableRateSlope2),
    stableRateSlope1: keepCurrentIfUndefined(update.stableRateSlope1),
    stableRateSlope2: keepCurrentIfUndefined(update.stableRateSlope2),
    baseStableRateOffset: keepCurrentIfUndefined(update.baseStableRateOffset),
    stableRateExcessOffset: keepCurrentIfUndefined(update.stableRateExcessOffset),
    optimalStableToTotalDebtRatio: keepCurrentIfUndefined(update.optimalStableToTotalDebtRatio),
  };
}

const ethUpdate = {
  forkBlockNumber: 17093012,
  borrowUpdates: [
    {
      asset: 'CRV_UNDERLYING',
      enabledToBorrow: KEEP_CURRENT,
      flashloanable: KEEP_CURRENT,
      stableRateModeEnabled: KEEP_CURRENT,
      borrowableInIsolation: KEEP_CURRENT,
      withSiloedBorrowing: KEEP_CURRENT,
      reserveFactor: 35_00n,
    },
  ],
  rateStrategyUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 350n,
      }),
    },
    {
      asset: 'USDT_UNDERLYING',
      params: partialRateUpdate({
        optimalUsageRatio: 80_00n,
        variableRateSlope2: 75_00n,
      }),
    },
    {
      asset: 'WBTC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 400n,
      }),
    },
  ],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 41776268,
  borrowUpdates: [
    {
      asset: 'CRV_UNDERLYING',
      enabledToBorrow: KEEP_CURRENT,
      flashloanable: KEEP_CURRENT,
      stableRateModeEnabled: KEEP_CURRENT,
      borrowableInIsolation: KEEP_CURRENT,
      withSiloedBorrowing: KEEP_CURRENT,
      reserveFactor: 35_00n,
    },
  ],
  rateStrategyUpdates: [
    {
      asset: 'DPI_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 10_00n,
      }),
    },
    {
      asset: 'EURS_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 600n,
      }),
    },
    {
      asset: 'USDC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 350n,
      }),
    },
    {
      asset: 'WBTC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 400n,
      }),
    },
  ],
} satisfies NetworkUpdate;

const avalancheUpdate = {
  forkBlockNumber: 29902181,
  rateStrategyUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 350n,
      }),
    },
    {
      asset: 'WBTCe_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 400n,
      }),
    },
  ],
} satisfies NetworkUpdate;

const arbUpdate = {
  forkBlockNumber: 82691135,
  rateStrategyUpdates: [
    {
      asset: 'EURS_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 600n,
      }),
    },
    {
      asset: 'USDC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 350n,
      }),
    },
    {
      asset: 'WBTC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 400n,
      }),
    },
  ],
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 97539765,
  rateStrategyUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 350n,
      }),
    },
    {
      asset: 'WBTC_UNDERLYING',
      params: partialRateUpdate({
        variableRateSlope1: 400n,
      }),
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Ethereum: ethUpdate,
  Polygon: polygonUpdate,
  Optimism: optimismUpdate,
  Avalanche: avalancheUpdate,
} satisfies AllUpdates;

export default updates;
