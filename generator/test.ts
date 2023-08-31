import {
  AllUpdates,
  EngineValue,
  KEEP_CURRENT,
  NetworkUpdate,
  Networks,
  foundryNetworkNamePerNetwork,
} from './index.js';

const executorPerNetwork: Record<Networks, string> = {
  Ethereum: 'AaveGovernanceV2.SHORT_EXECUTOR',
  Polygon: 'AaveGovernanceV2.POLYGON_BRIDGE_EXECUTOR',
  Arbitrum: 'AaveGovernanceV2.ARBITRUM_BRIDGE_EXECUTOR',
  Optimism: 'AaveGovernanceV2.OPTIMISM_BRIDGE_EXECUTOR',
  Metis: 'AaveGovernanceV2.METIS_BRIDGE_EXECUTOR',
  // Avalanche guardian address
  Avalanche: '0xa35b76E4935449E33C56aB24b23fcd3246f13470',
};

type ReserveConfigChanges = Partial<{
  symbol: string;
  underlying: string;
  aToken: string;
  stableDebtToken: string;
  variableDebtToken: string;
  decimals: BigInt;
  ltv: BigInt;
  liquidationThreshold: BigInt;
  liquidationBonus: BigInt;
  liquidationProtocolFee: BigInt;
  reserveFactor: BigInt;
  usageAsCollateralEnabled: boolean;
  borrowingEnabled: boolean;
  interestRateStrategy: string;
  stableBorrowRateEnabled: boolean;
  isActive: boolean;
  isFrozen: boolean;
  isSiloed: boolean;
  isBorrowableInIsolation: boolean;
  isFlashloanable: boolean;
  supplyCap: BigInt;
  borrowCap: BigInt;
  debtCeiling: BigInt;
  eModeCategory: BigInt;
}>;

function valueOrUndefined<T>(value: EngineValue<T>): T | undefined {
  return value === KEEP_CURRENT ? undefined : (value as T);
}

function asPerAssetChanges(update: NetworkUpdate): {[asset: string]: ReserveConfigChanges} {
  const result: {[asset: string]: ReserveConfigChanges} = {};

  if (update.capsUpdates) {
    for (const capUpdate of update.capsUpdates) {
      const asset = capUpdate.asset;
      if (!result[asset]) {
        result[asset] = {};
      }
      result[asset].supplyCap = valueOrUndefined(capUpdate.supplyCap);
      result[asset].borrowCap = valueOrUndefined(capUpdate.borrowCap);
    }
  }

  if (update.collateralUpdates) {
    for (const collateralUpdate of update.collateralUpdates) {
      const asset = collateralUpdate.asset;
      if (!result[asset]) {
        result[asset] = {};
      }
      result[asset].ltv = valueOrUndefined(collateralUpdate.ltv);
      result[asset].liquidationThreshold = valueOrUndefined(collateralUpdate.liqThreshold);
      result[asset].liquidationBonus = valueOrUndefined(collateralUpdate.liqBonus);
      result[asset].liquidationProtocolFee = valueOrUndefined(collateralUpdate.liqProtocolFee);
      result[asset].debtCeiling = valueOrUndefined(collateralUpdate.debtCeiling);
      result[asset].eModeCategory = valueOrUndefined(collateralUpdate.eModeCategory);
    }
  }

  if (update.borrowUpdates) {
    for (const borrowUpdate of update.borrowUpdates) {
      const asset = borrowUpdate.asset;
      if (!result[asset]) {
        result[asset] = {};
      }

      result[asset].borrowingEnabled = valueOrUndefined(borrowUpdate.enabledToBorrow);
      result[asset].isFlashloanable = valueOrUndefined(borrowUpdate.flashloanable);
      result[asset].stableBorrowRateEnabled = valueOrUndefined(borrowUpdate.stableRateModeEnabled);
      result[asset].isBorrowableInIsolation = valueOrUndefined(borrowUpdate.borrowableInIsolation);
      result[asset].isSiloed = valueOrUndefined(borrowUpdate.withSiloedBorrowing);
      result[asset].reserveFactor = valueOrUndefined(borrowUpdate.reserveFactor);
    }
  }

  if (update.rateStrategyUpdates) {
    for (const rateStrategyUpdate of update.rateStrategyUpdates) {
      const asset = rateStrategyUpdate.asset;
      if (!result[asset]) {
        result[asset] = {};
      }
      // TODO: validate interest rate strategies
      result[asset].interestRateStrategy = `${asset}After.interestRateStrategy`;
    }
  }

  if (update.priceFeedUpdates) {
    for (const priceFeedUpdate of update.priceFeedUpdates) {
      const asset = priceFeedUpdate.asset;
      if (!result[asset]) {
        result[asset] = {};
      }
      // TODO: Test price feed updates
    }
  }

  return result;
}

export function generateTestFile(updateDate: string, updates: AllUpdates): string {
  return `
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
${Object.keys(updates)
  .map((network) => {
    return `\
import {
  AaveV3${network},
  AaveV3${network}Assets
} from 'aave-helpers/v3-config-engine/AaveV3Payload${network}.sol';`;
  })
  .join('\n')}
import {
${Object.keys(updates)
  .map((network) => `  AaveV3${network}Update${updateDate}Payload`)
  .join(',\n')}
} from './AaveV3Update_${updateDate}.sol';

${Object.keys(updates)
  .map((network) => {
    const update = updates[network as Networks] as NetworkUpdate;
    const perAssetChanges = asPerAssetChanges(update);

    return `\
contract AaveV3${network}Update_${updateDate}_Test is ProtocolV3TestBase {
  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('${foundryNetworkNamePerNetwork[network as Networks]}'), ${
      update.forkBlockNumber
    });
  }

  function test${network}${updateDate}UpdatePayload() public {
    ReserveConfig[] memory allConfigsBefore = createConfigurationSnapshot(
      'preTest${network}Update${updateDate}',
      AaveV3${network}.POOL
    );

${Object.keys(perAssetChanges)
  .map((asset) => {
    return `\
    ReserveConfig memory ${asset}Before = _findReserveConfig(
      allConfigsBefore,
      AaveV3${network}Assets.${asset}
    );`;
  })
  .join('\n')}

    GovHelpers.executePayload(
      vm,
      address(new AaveV3${network}Update${updateDate}Payload()),
      ${executorPerNetwork[network as Networks]}
    );

    ReserveConfig[] memory allConfigsAfter = createConfigurationSnapshot(
      'postTest${network}Update${updateDate}',
      AaveV3${network}.POOL
    );

    diffReports('preTest${network}Update${updateDate}', 'postTest${network}Update${updateDate}');

    address[] memory assetsChanged = new address[](${Object.keys(perAssetChanges).length});
${Object.keys(perAssetChanges)
  .map((asset, index) => {
    return `    assetsChanged[${index}] = AaveV3${network}Assets.${asset};`;
  })
  .join('\n')}

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

${Object.keys(perAssetChanges)
  .map((asset) => {
    const changes = perAssetChanges[asset]!;
    return `\
    {${
      changes.interestRateStrategy !== undefined
        ? `\n      ReserveConfig memory ${asset}After = _findReserveConfig(
        allConfigsAfter,
        AaveV3${network}Assets.${asset}
      );`
        : ''
    }
      ${Object.keys(changes)
        .filter((key) => changes[key as keyof typeof changes] !== undefined)
        .map(
          (key) => `${asset}Before.${key} = ${changes[key as keyof typeof changes]!.toString()};`
        )
        .join('\n      ')}
      _validateReserveConfig(${asset}Before, allConfigsAfter);
    }`;
  })
  .join('\n')}
  }
}`;
  })
  .join('\n\n')}`;
}
