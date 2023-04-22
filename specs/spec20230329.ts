import {BigNumber} from '@ethersproject/bignumber';
import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const arbUpdate = {
  forkBlockNumber: 82691135,
  capsUpdates: [
    {
      asset: 'WETH_UNDERLYING',
      supplyCap: BigNumber.from(45001),
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const ethUpdate = {
  forkBlockNumber: 17093012,
  capsUpdates: [
    {
      asset: 'rETH_UNDERLYING',
      supplyCap: BigNumber.from(20001),
      borrowCap: KEEP_CURRENT,
    },
    {
      asset: 'CRV_UNDERLYING',
      supplyCap: BigNumber.from(51000001),
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 41776268,
  collateralUpdates: [
    {
      asset: 'USDC_UNDERLYING',
      ltv: BigNumber.from(8000),
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
        optimalUsageRatio: BigNumber.from(80_00),
        baseVariableBorrowRate: BigNumber.from(1_00),
        variableRateSlope1: BigNumber.from(3_80),
        variableRateSlope2: BigNumber.from(80_00),
        stableRateSlope1: BigNumber.from(4_00),
        stableRateSlope2: BigNumber.from(80_00),
        baseStableRateOffset: BigNumber.from(3_00),
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
