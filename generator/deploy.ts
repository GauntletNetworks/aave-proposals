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
import {
${Object.keys(updates)
  .map((network) => `  AaveV3${network}Update${updateDate}Payload`)
  .join(',\n')}
} from './AaveV3Update_${updateDate}.sol';

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
    GovHelpers.createProposal(payloads, '');
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
