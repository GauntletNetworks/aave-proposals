import {AllUpdates, EModeCategoryUpdate, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const stablecoinEModeUpdate: EModeCategoryUpdate = {
  eModeCategory: 1n,
  ltv: 9300n,
  liqThreshold: 9500n,
  liqBonus: KEEP_CURRENT,
  priceSource: KEEP_CURRENT,
  label: KEEP_CURRENT,
};

const eModeUpdates = [stablecoinEModeUpdate];

const avalancheUpdate = {
  forkBlockNumber: 30240937,
  eModeUpdates,
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 99835340,
  eModeUpdates,
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 42914128,
  eModeUpdates,
} satisfies NetworkUpdate;

const arbUpdate = {
  forkBlockNumber: 92432492,
  eModeUpdates,
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Polygon: polygonUpdate,
  Avalanche: avalancheUpdate,
  Optimism: optimismUpdate,
} satisfies AllUpdates;

export default updates;
