import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const ethUpdate = {
  forkBlockNumber: 17093012,
  capsUpdates: [
    {
      asset: 'BAL_UNDERLYING',
      supplyCap: 350000n,
      borrowCap: KEEP_CURRENT,
    },
    {
      asset: 'LINK_UNDERLYING',
      supplyCap: 15000000n,
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 82691135,
  capsUpdates: [
    {
      asset: 'OP_UNDERLYING',
      supplyCap: 10000000n,
      borrowCap: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Ethereum: ethUpdate,
  Optimism: optimismUpdate,
} satisfies AllUpdates;

export default updates;
