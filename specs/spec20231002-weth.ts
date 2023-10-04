import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const wethUpdate = {
  asset: 'WETH_UNDERLYING',
  params: {
    optimalUsageRatio: KEEP_CURRENT,
    baseVariableBorrowRate: 0n,
    variableRateSlope1: KEEP_CURRENT,
    variableRateSlope2: KEEP_CURRENT,
    stableRateSlope1: KEEP_CURRENT,
    stableRateSlope2: KEEP_CURRENT,
    baseStableRateOffset: KEEP_CURRENT,
    stableRateExcessOffset: KEEP_CURRENT,
    optimalStableToTotalDebtRatio: KEEP_CURRENT,
  },
};

const meta = {
  title: 'Gauntlet Recommendations to lower WETH Variable Base to 0 on Arbitrum, Optimism v3',
  author: 'Gauntlet',
  discussionsUrl:
    'https://governance.aave.com/t/gauntlet-interest-rate-recommendations-for-weth-and-wmatic-on-v2-and-v3/14588',
};

const optimismUpdate = {
  forkBlockNumber: 110337425,
  ...meta,
  rateStrategyUpdates: [wethUpdate],
} satisfies NetworkUpdate;

const arbitrumUpdate = {
  forkBlockNumber: 136860213,
  ...meta,
  rateStrategyUpdates: [wethUpdate],
} satisfies NetworkUpdate;

const updates = {
  Optimism: optimismUpdate,
  Arbitrum: arbitrumUpdate,
} satisfies AllUpdates;

export default updates;
