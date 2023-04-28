import {
  AllUpdates,
  CollateralUpdate,
  EModeCategoryUpdate,
  KEEP_CURRENT,
  NetworkUpdate,
} from '../generator/index.js';

const stablecoinEModeUpdate: EModeCategoryUpdate = {
  eModeCategory: 1n,
  ltv: 9300n,
  liqThreshold: 9500n,
  liqBonus: KEEP_CURRENT,
  priceSource: KEEP_CURRENT,
  label: KEEP_CURRENT,
};

function removeEModeFor(asset: string): CollateralUpdate {
  return {
    asset,
    ltv: KEEP_CURRENT,
    liqBonus: KEEP_CURRENT,
    liqThreshold: KEEP_CURRENT,
    debtCeiling: KEEP_CURRENT,
    liqProtocolFee: KEEP_CURRENT,
    eModeCategory: 0n,
  };
}

const avalancheUpdate = {
  forkBlockNumber: 29308324,
  collateralUpdates: [removeEModeFor('USDt_UNDERLYING'), removeEModeFor('MAI_UNDERLYING')],
  eModeUpdates: [stablecoinEModeUpdate],
} satisfies NetworkUpdate;

const optimismUpdate = {
  forkBlockNumber: 94864809,
  collateralUpdates: [removeEModeFor('USDT_UNDERLYING'), removeEModeFor('sUSD_UNDERLYING')],
  eModeUpdates: [stablecoinEModeUpdate],
} satisfies NetworkUpdate;

const polygonUpdate = {
  forkBlockNumber: 42037324,

  collateralUpdates: [
    removeEModeFor('USDT_UNDERLYING'),
    removeEModeFor('EURS_UNDERLYING'),
    removeEModeFor('miMATIC_UNDERLYING'),
    {
      asset: 'jEUR_UNDERLYING',
      ltv: KEEP_CURRENT,
      liqBonus: KEEP_CURRENT,
      liqThreshold: 0n,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: 0n,
    },
    {
      asset: 'agEUR_UNDERLYING',
      ltv: KEEP_CURRENT,
      liqBonus: KEEP_CURRENT,
      liqThreshold: 0n,
      debtCeiling: KEEP_CURRENT,
      liqProtocolFee: KEEP_CURRENT,
      eModeCategory: 0n,
    },
  ],
  eModeUpdates: [stablecoinEModeUpdate],
} satisfies NetworkUpdate;

const arbUpdate = {
  forkBlockNumber: 84991019,
  collateralUpdates: [removeEModeFor('USDT_UNDERLYING'), removeEModeFor('EURS_UNDERLYING')],
  eModeUpdates: [stablecoinEModeUpdate],
} satisfies NetworkUpdate;

const updates = {
  Arbitrum: arbUpdate,
  Polygon: polygonUpdate,
  Avalanche: avalancheUpdate,
  Optimism: optimismUpdate,
} satisfies AllUpdates;

export default updates;
