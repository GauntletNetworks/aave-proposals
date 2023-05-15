import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const arbUpdate = {
  forkBlockNumber: 82691135,
  capsUpdates: [
    {
      asset: 'WETH_UNDERLYING',
      supplyCap: 45001n,
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const ethUpdate = {
  forkBlockNumber: 17093012,
  capsUpdates: [
    {
      asset: 'rETH_UNDERLYING',
      supplyCap: 20001n,
      borrowCap: KEEP_CURRENT,
    },
    {
      asset: 'CRV_UNDERLYING',
      supplyCap: 51000001n,
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 41776268,
  collateralUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      ltv: 8000n,
      liqBonus: KEEP_CURRENT,
      liqThreshold: KEEP_CURRENT,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
  eModeUpdates: [
    {
      eModeCategory: 1n,
      ltv: 9740n,
      liqThreshold: KEEP_CURRENT,
      liqBonus: KEEP_CURRENT,
      priceSource: KEEP_CURRENT,
      label: KEEP_CURRENT,
    },
  ],
  rateStrategyUpdates: [
    {
      asset: 'miMATIC_UNDERLYING',
      params: {
        optimalUsageRatio: 80_00n,
        baseVariableBorrowRate: 1_00n,
        variableRateSlope1: 3_80n,
        variableRateSlope2: 80_00n,
        stableRateSlope1: 4_00n,
        stableRateSlope2: 80_00n,
        baseStableRateOffset: 3_00n,
        stableRateExcessOffset: KEEP_CURRENT,
        optimalStableToTotalDebtRatio: KEEP_CURRENT,
      },
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Ethereum: ethUpdate,
  Polygon: polygonUpdate,
} satisfies AllUpdates;

export default updates;
