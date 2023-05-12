import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const ethUpdate = {
  forkBlockNumber: 17093012,
  capsUpdates: [
    {
      asset: 'LUSD_UNDERLYING',
      supplyCap: KEEP_CURRENT,
      borrowCap: 4_000_000n,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Ethereum: ethUpdate,
} satisfies AllUpdates;

export default updates;
