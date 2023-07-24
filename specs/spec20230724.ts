import {AllUpdates, KEEP_CURRENT, NetworkUpdate} from '../generator/index.js';

const arbUpdate = {
  forkBlockNumber: 114584857,
  collateralUpdates: [
    {
      asset: 'LINK_UNDERLYING',
      ltv: KEEP_CURRENT,
      liqBonus: KEEP_CURRENT,
      liqThreshold: 7750n,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const ethUpdate = {
  forkBlockNumber: 17765584,
  collateralUpdates: [
    {
      asset: 'DAI_UNDERLYING',
      ltv: 7700n,
      liqBonus: KEEP_CURRENT,
      liqThreshold: KEEP_CURRENT,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
    {
      asset: 'USDC_UNDERLYING',
      ltv: KEEP_CURRENT,
      liqBonus: KEEP_CURRENT,
      liqThreshold: 8000n,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
    {
      asset: 'wstETH_UNDERLYING',
      ltv: KEEP_CURRENT,
      liqBonus: 10600n,
      liqThreshold: KEEP_CURRENT,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: KEEP_CURRENT,
    },
  ],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Ethereum: ethUpdate,
} satisfies AllUpdates;

export default updates;
