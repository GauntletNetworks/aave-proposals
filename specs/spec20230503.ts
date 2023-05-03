import {AllUpdates, NetworkUpdate} from '../generator/index.js';

const arbUpdate = {
  forkBlockNumber: 86975143,
  capsUpdates: [
    {
      asset: 'EURS_UNDERLYING',
      supplyCap: 65000n,
      borrowCap: 65000n,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
} satisfies AllUpdates;

export default updates;
