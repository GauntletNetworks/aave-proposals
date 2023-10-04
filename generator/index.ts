import * as fs from 'fs';
import * as path from 'path';
import yargs from 'yargs';
import {hideBin} from 'yargs/helpers';
import fm from 'front-matter';
import dotenv from 'dotenv';
import {$} from 'execa';

import {uploadToIpfs} from './ipfs.js';
import {generatePayloadFiles} from './payload.js';
import {generateDeployFile} from './deploy.js';
import {generateTestFile} from './test.js';

const $$ = $({stdio: 'inherit', verbose: true});

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
  optimalUsageRatio: BigInt;
  baseVariableBorrowRate: BigInt;
  variableRateSlope1: BigInt;
  variableRateSlope2: BigInt;
  stableRateSlope1: BigInt;
  stableRateSlope2: BigInt;
  baseStableRateOffset: BigInt;
  stableRateExcessOffset: BigInt;
  optimalStableToTotalDebtRatio: BigInt;
}>;

export type CapsUpdate = EngineUpdate<{
  asset: string;
  supplyCap: BigInt;
  borrowCap: BigInt;
}>;

export type PriceFeedUpdate = EngineUpdate<{
  asset: string;
  priceFeed: string;
}>;

export type CollateralUpdate = EngineUpdate<{
  asset: string;
  ltv: BigInt;
  liqThreshold: BigInt;
  liqBonus: BigInt;
  debtCeiling: BigInt;
  liqProtocolFee: BigInt;
  eModeCategory: BigInt;
}>;

export type BorrowUpdate = EngineUpdate<{
  asset: string;
  enabledToBorrow: boolean;
  flashloanable: boolean;
  stableRateModeEnabled: boolean;
  borrowableInIsolation: boolean;
  withSiloedBorrowing: boolean;
  reserveFactor: BigInt;
}>;

export type RateStrategyUpdate = {
  asset: string;
  params: RateStrategyParams;
};

export type Networks = 'Ethereum' | 'Polygon' | 'Arbitrum' | 'Optimism' | 'Avalanche' | 'Metis';

export const govHelperNetworkNames: Record<Networks, string> = {
  Ethereum: 'Mainnet',
  Polygon: 'Polygon',
  Arbitrum: 'Arbitrum',
  Optimism: 'Optimism',
  Avalanche: 'Avalanche',
  Metis: 'Metis',
};

export const foundryNetworkNamePerNetwork: Record<Networks, string> = {
  Ethereum: 'mainnet',
  Polygon: 'polygon',
  Arbitrum: 'arbitrum',
  Optimism: 'optimism',
  Avalanche: 'avalanche',
  Metis: 'metis',
};

export interface NetworkUpdate {
  forkBlockNumber: number;
  author: string;
  title: string;
  discussionsUrl: string;
  capsUpdates?: CapsUpdate[];
  collateralUpdates?: CollateralUpdate[];
  borrowUpdates?: BorrowUpdate[];
  rateStrategyUpdates?: RateStrategyUpdate[];
  priceFeedUpdates?: PriceFeedUpdate[];
}

export type AllUpdates = Partial<Record<Networks, NetworkUpdate>>;

function keepCurrentOrElse<T>(value: EngineValue<T>, else_op: (val: T) => string): string {
  return value === KEEP_CURRENT ? 'EngineFlags.KEEP_CURRENT' : else_op(value);
}

export function valueOrKeepCurrent<T extends {toString(): string}>(value: EngineValue<T>): string {
  return keepCurrentOrElse(value, (val) => val.toString());
}

export function bpsToRayOrKeepCurrent<T extends BigInt>(value: EngineValue<T>): string {
  return keepCurrentOrElse(value, (val) => `_bpsToRay(${val.toString()})`);
}

export function boolOrKeepCurrent(value: EngineValue<boolean>): string {
  return keepCurrentOrElse(value, (val) => (val ? 'EngineFlags.ENABLED' : 'EngineFlags.DISABLED'));
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
  const payloadFiles = generatePayloadFiles(updateDate, updates);
  const deployFile = generateDeployFile(updateDate, updates);
  const testFile = generateTestFile(updateDate, updates);

  const files = {
    [`AaveV3Update_${updateDate}_Test.t.sol`]: testFile,
    [`DeployAaveV3Update_${updateDate}.s.sol`]: deployFile,
  };

  for (const network of Object.keys(payloadFiles)) {
    files[`AaveV3${network}_${updateDate}.sol`] = payloadFiles[network];
  }

  return files;
}

function generateFollowupCommands(updateDate: string, updates: AllUpdates) {
  const networks = Object.keys(updates) as Networks[];

  const commands: string[] = [];
  commands.push(`To Test:\n  yarn ts-node generator/index.ts test --ud ${updateDate}`);
  commands.push(
    `To Upload IPFS Blob:\n  yarn ts-node generator/index.ts upload-ipfs -d specs/description${updateDate}.md`
  );

  for (const network of networks) {
    commands.push(
      `To Deploy ${network} Payload:\n  yarn ts-node generator/index.ts deploy --ud ${updateDate} --network ${network}`
    );
  }

  commands.push(
    `After adding IPFS and payload addresses to CreateProposal:\n  yarn ts-node generator/index.ts emit-proposal --ud ${updateDate}`
  );

  return commands.join('\n');
}

async function main() {
  await yargs(hideBin(process.argv))
    .command(
      'generate',
      'Generate new AaveV3 update',
      (yargs) => {
        return yargs
          .option('updateDate', {
            alias: 'ud',
            describe: "Update date in YYYYMMDD format. Example: '20230320'",
            type: 'string',
            demandOption: true,
          })
          .option('updateFile', {
            alias: 'uf',
            describe: 'Path to the typescript update file which exports an AllUpdates value',
            type: 'string',
            demandOption: true,
          })
          .option('dry', {
            alias: 'd',
            describe: "Dry run, don't generate files.",
            type: 'boolean',
            default: false,
          });
      },
      async (argv) => {
        const updateDate = argv.updateDate as string;
        const updateFile = argv.updateFile as string;

        const updates: AllUpdates = (await import(path.join('..', updateFile))).default;

        const files = generateAaveV3UpdateFiles(updateDate, updates);
        const folderPath = `src/AaveV3Update_${updateDate}`;
        const commands = generateFollowupCommands(updateDate, updates);

        if (!argv.dry) {
          createFolder(folderPath);
          createFiles(folderPath, files);

          console.log('✅ Generator Success!');
          console.log(commands);
        }
      }
    )
    .command(
      'upload-ipfs',
      'Upload proposal descriptions to IPFS',
      (yargs) => {
        return yargs.option('description', {
          alias: 'd',
          describe: 'Path to the description file',
          type: 'string',
          demandOption: true,
        });
      },
      async (argv) => {
        // We need IPFS uploading secrets for this task.
        dotenv.config();

        const description = argv.description as string;
        const descriptionContent = fs.readFileSync(description, 'utf8');

        const parsedContent = fm(descriptionContent);

        await uploadToIpfs(parsedContent.attributes as any, parsedContent.body);
      }
    )
    .command(
      'test',
      'Run the tests for a given update using forge',
      (yargs) => {
        return yargs.option('updateDate', {
          alias: 'ud',
          describe: "Update date in YYYYMMDD format. Example: '20230320'",
          type: 'string',
          demandOption: true,
        });
      },
      async (argv) => {
        // We need rpc url secrets for this command.
        dotenv.config();

        await $$`forge test --match-contract AaveV3.*Update_${argv.updateDate}_Test -vv`;
      }
    )
    .command(
      'deploy',
      'Deploy and verify the payload contract for a given update and network',
      (yargs) => {
        return yargs
          .option('updateDate', {
            alias: 'ud',
            describe: "Update date in YYYYMMDD format. Example: '20230320'",
            type: 'string',
            demandOption: true,
          })
          .option('network', {
            alias: 'n',
            describe: 'Which payload should be deployed',
            type: 'string',
            demandOption: true,
          })
          .option('dry', {
            alias: 'd',
            describe: "Dry run, don't broadcast transactions.",
            type: 'boolean',
            default: false,
          });
      },
      async (argv) => {
        // We need rpc url secrets for this command.
        dotenv.config();

        const network = argv.network as Networks;
        const updateDate = argv.updateDate as string;
        const isDry = argv.dry as boolean;

        const broadcastOptions = isDry
          ? ''
          : `--broadcast --legacy --private-key ${process.env.PRIVATE_KEY} --verify`.split(' ');

        const deployScriptFile = `src/AaveV3Update_${updateDate}/DeployAaveV3Update_${updateDate}.s.sol`;

        await $$`forge script ${deployScriptFile}:Deploy${updateDate}Payload${network} --rpc-url ${foundryNetworkNamePerNetwork[network]} -vvvv ${broadcastOptions}`;
      }
    )
    .command(
      'emit-proposal',
      'Emit proposal calldata for a given update based on the details in CreateProposal',
      (yargs) => {
        return yargs.option('updateDate', {
          alias: 'ud',
          describe: "Update date in YYYYMMDD format. Example: '20230320'",
          type: 'string',
          demandOption: true,
        });
      },
      async (argv) => {
        // We need rpc url secrets for this command.
        dotenv.config();

        const updateDate = argv.updateDate as string;
        const deployScriptFile = `src/AaveV3Update_${updateDate}/DeployAaveV3Update_${updateDate}.s.sol`;

        await $$`forge script ${deployScriptFile}:CreateProposal --rpc-url mainnet -vv --sender 0x25F2226B597E8F9514B3F68F00f494cF4f286491`;
      }
    )
    .option('verbose', {
      alias: 'v',
      type: 'boolean',
      description: 'Run with verbose logging',
    })
    .demandCommand(1, 'Must pass at least one command')
    .help()
    .parseAsync();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
