import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const arbUpdate = {
  forkBlockNumber: 82691135,
  capsUpdates: [
    {
      asset: 'WETH_UNDERLYING',
      supplyCap: BigInt(45001),
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const ethUpdate = {
  forkBlockNumber: 17093012,
  capsUpdates: [
    {
      asset: 'rETH_UNDERLYING',
      supplyCap: BigInt(20001),
      borrowCap: KEEP_CURRENT,
    },
    {
      asset: 'CRV_UNDERLYING',
      supplyCap: BigInt(51000001),
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 41776268,
  collateralUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      ltv: BigInt(8000),
      liqBonus: KEEP_CURRENT,
      liqThreshold: KEEP_CURRENT,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
  rateStrategyUpdates: [
    {
      asset: 'miMATIC_UNDERLYING',
      params: {
        optimalUsageRatio: BigInt(80_00),
        baseVariableBorrowRate: BigInt(1_00),
        variableRateSlope1: BigInt(3_80),
        variableRateSlope2: BigInt(80_00),
        stableRateSlope1: BigInt(4_00),
        stableRateSlope2: BigInt(80_00),
        baseStableRateOffset: BigInt(3_00),
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
