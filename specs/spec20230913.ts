import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const maiUpdate = {
  asset: 'MAI_UNDERLYING',
  ltv: KEEP_CURRENT,
  liqBonus: KEEP_CURRENT,
  liqThreshold: KEEP_CURRENT,
  debtCeiling: 0n,
  liqProtocolFee: KEEP_CURRENT,
  eModeCategory: KEEP_CURRENT,
};

const arbUpdate = {
  forkBlockNumber: 130813044,
  collateralUpdates: [maiUpdate],
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 109518280,
  collateralUpdates: [maiUpdate],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 47501942,
  collateralUpdates: [
    {
      ...maiUpdate,
      asset: 'miMATIC_UNDERLYING',
    },
  ],
} satisfies NetworkUpdate;

const avalancheUpdate = {
  forkBlockNumber: 35146117,
  collateralUpdates: [maiUpdate],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Optimism: optimismUpdate,
  Polygon: polygonUpdate,
  Avalanche: avalancheUpdate,
} satisfies AllUpdates;

export default updates;
