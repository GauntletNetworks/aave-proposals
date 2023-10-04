import {AllUpdates, govHelperNetworkNames, Networks} from './index.js';

export function generateDeployFile(updateDate: string, updates: AllUpdates): string {
  // Avalanche payloads are not yet called from main governance
  const networksOtherThanGuardian = Object.keys(updates).filter(
    (network) => network !== 'Avalanche'
  );

  const hasEthereum = Object.keys(updates).includes('Ethereum');

  return `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
${!hasEthereum ? `  EthereumScript,\n` : ''}${Object.keys(updates)
    .map((network) => `  ${network}Script`)
    .join(',\n')}
} from 'aave-helpers/ScriptUtils.sol';
${Object.keys(updates)
  .map((network) => {
    return `\
import {
  AaveV3${network}Update${updateDate}Payload
} from './AaveV3${network}_${updateDate}.sol';`;
  })
  .join('\n')}

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](${
      networksOtherThanGuardian.length
    });
${networksOtherThanGuardian
  .map((network, index) => {
    return `    payloads[${index}] = GovHelpers.build${
      govHelperNetworkNames[network as Networks]
    }(address(0));`;
  })
  .join('\n')}
    GovHelpers.createProposal(
      payloads,
      GovHelpers.ipfsHashFile(
        vm,
        'src/AaveV3Update_${updateDate}/AaveV3Update_${updateDate}.md'
      )
    );
  }
}

${Object.keys(updates)
  .map((network) => {
    return `contract Deploy${updateDate}Payload${network} is ${network}Script {
  function run() external broadcast {
    new AaveV3${network}Update${updateDate}Payload();
  }
}`;
  })
  .filter((x) => x)
  .join('\n\n')}`;
}
