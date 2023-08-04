import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const ethUpdate = {
  forkBlockNumber: 17844107,
  collateralUpdates: [
    {
      asset: 'CRV_UNDERLYING',
      ltv: 3500n,
      liqThreshold: 4100n,
      liqBonus: KEEP_CURRENT,
      debtCeiling: 5_000_000n,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 45912754,
  collateralUpdates: [
    {
      asset: 'CRV_UNDERLYING',
      ltv: 3500n,
      liqThreshold: 6500n,
      liqBonus: KEEP_CURRENT,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Ethereum: ethUpdate,
  Polygon: polygonUpdate,
} satisfies AllUpdates;

export default updates;
