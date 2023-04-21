import {BigNumber} from '@ethersproject/bignumber';
import * as fs from 'fs';
import * as path from 'path';
import {generatePayloadFile} from './payload';
import {generateDeployFile} from './deploy';
import {generateTestFile} from './test';

// Function to create a folder if it doesn't exist
function createFolder(folderPath: string): void {
  if (!fs.existsSync(folderPath)) {
    fs.mkdirSync(folderPath);
  }
}

export const KEEP_CURRENT = 'KEEP_CURRENT' as const;

export type EngineValue<T> = T | typeof KEEP_CURRENT;

type EngineUpdate<T> = {
  [P in keyof T]: EngineValue<T[P]>;
};

export type RateStrategyParams = EngineUpdate<{
  optimalUsageRatio: BigNumber;
  baseVariableBorrowRate: BigNumber;
  variableRateSlope1: BigNumber;
  variableRateSlope2: BigNumber;
  stableRateSlope1: BigNumber;
  stableRateSlope2: BigNumber;
  baseStableRateOffset: BigNumber;
  stableRateExcessOffset: BigNumber;
  optimalStableToTotalDebtRatio: BigNumber;
}>;

export type CapsUpdate = EngineUpdate<{
  asset: string;
  supplyCap: BigNumber;
  borrowCap: BigNumber;
}>;

export type PriceFeedUpdate = EngineUpdate<{
  asset: string;
  priceFeed: string;
}>;

export type CollateralUpdate = EngineUpdate<{
  asset: string;
  ltv: BigNumber;
  liqThreshold: BigNumber;
  liqBonus: BigNumber;
  debtCeiling: BigNumber;
  liqProtocolFee: BigNumber;
  eModeCategory: BigNumber;
}>;

export type BorrowUpdate = EngineUpdate<{
  asset: string;
  enabledToBorrow: boolean;
  flashloanable: boolean;
  stableRateModeEnabled: boolean;
  borrowableInIsolation: boolean;
  withSiloedBorrowing: boolean;
  reserveFactor: BigNumber;
}>;

export type RateStrategyUpdate = {
  asset: string;
  params: EngineUpdate<RateStrategyParams>;
};

export type Networks = 'Ethereum' | 'Polygon' | 'Arbitrum' | 'Optimism' | 'Avalanche';

export const govHelperNetworkNames: Record<Networks, string> = {
  Ethereum: 'Mainnet',
  Polygon: 'Polygon',
  Arbitrum: 'Arbitrum',
  Optimism: 'Optimism',
  Avalanche: 'Avalanche',
};

export interface NetworkUpdate {
  forkBlockNumber: number;
  capsUpdates?: CapsUpdate[];
  collateralUpdates?: CollateralUpdate[];
  borrowUpdates?: BorrowUpdate[];
  rateStrategyUpdates?: RateStrategyUpdate[];
  priceFeedUpdates?: PriceFeedUpdate[];
}

export type AllUpdates = Partial<Record<Networks, NetworkUpdate>>;

export function valueOrKeepCurrent<T extends {toString(): string}>(value: EngineValue<T>): string {
  return value === KEEP_CURRENT ? 'EngineFlags.KEEP_CURRENT' : value.toString();
}

export function bpsToRayOrKeepCurrent<T extends BigNumber>(value: EngineValue<T>): string {
  return value === KEEP_CURRENT ? 'EngineFlags.KEEP_CURRENT' : `_bpsToRay(${value.toString()})`;
}

export function boolOrKeepCurrent(value: EngineValue<boolean>): string {
  return value === KEEP_CURRENT
    ? 'EngineFlags.KEEP_CURRENT'
    : value
    ? 'EngineFlags.ENABLED'
    : 'EngineFlags.DISABLED';
}

interface Files {
  [name: string]: string;
}

function createFiles(folderPath: string, files: Files): void {
  Object.keys(files).forEach((name) => {
    fs.writeFileSync(path.join(folderPath, name), files[name]);
  });
}

// Function to generate the AaveV3 Caps Update Solidity files
function generateAaveV3UpdateFiles(updateDate: string, updates: AllUpdates): Files {
  const payloadFile = generatePayloadFile(updateDate, updates);
  const deployFile = generateDeployFile(updateDate, updates);
  const testFile = generateTestFile(updateDate, updates);

  return {
    [`AaveV3Update_${updateDate}.sol`]: payloadFile,
    [`AaveV3Update_${updateDate}_Test.t.sol`]: testFile,
    [`DeployAaveV3Update_${updateDate}.s.sol`]: deployFile,
  };
}

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

async function main() {
  const updateDate = '20230329';
  const files = generateAaveV3UpdateFiles(updateDate, updates);
  const folderPath = `src/AaveV3Update_${updateDate}`;

  createFolder(folderPath);
  createFiles(folderPath, files);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
