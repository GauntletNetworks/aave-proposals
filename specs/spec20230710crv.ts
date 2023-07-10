import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const ethUpdate = {
  forkBlockNumber: 17665458,
  capsUpdates: [
    {
      asset: 'CRV_UNDERLYING',
      supplyCap: KEEP_CURRENT,
      borrowCap: 3800000n,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Ethereum: ethUpdate,
} satisfies AllUpdates;

export default updates;
