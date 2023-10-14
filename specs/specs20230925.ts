import {AllUpdates, KEEP_CURRENT, NetworkUpdate, RateStrategyUpdate} from '../generator/index.js';

const wethRateUpdate: RateStrategyUpdate = {
  asset: 'WETH_UNDERLYING',
  params: {
    optimalUsageRatio: KEEP_CURRENT,
    baseVariableBorrowRate: KEEP_CURRENT,
    variableRateSlope1: 330n,
    variableRateSlope2: KEEP_CURRENT,
    stableRateSlope1: KEEP_CURRENT,
    stableRateSlope2: KEEP_CURRENT,
    baseStableRateOffset: KEEP_CURRENT,
    stableRateExcessOffset: KEEP_CURRENT,
    optimalStableToTotalDebtRatio: KEEP_CURRENT,
  },
};

const arbUpdate = {
  forkBlockNumber: 134586734,
  rateStrategyUpdates: [wethRateUpdate],
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 110040663,
  rateStrategyUpdates: [wethRateUpdate],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 47982814,
  rateStrategyUpdates: [wethRateUpdate],
} satisfies NetworkUpdate;

const avalancheUpdate = {
  forkBlockNumber: 35657322,
  rateStrategyUpdates: [
    {
      ...wethRateUpdate,
      asset: 'WETHe_UNDERLYING',
    },
  ],
} satisfies NetworkUpdate;

const metisUpdate = {
  forkBlockNumber: 8735895,
  rateStrategyUpdates: [wethRateUpdate],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Optimism: optimismUpdate,
  Polygon: polygonUpdate,
  Avalanche: avalancheUpdate,
  Metis: metisUpdate,
} satisfies AllUpdates;

export default updates;
