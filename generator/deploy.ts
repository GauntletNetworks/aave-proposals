import {AllUpdates, govHelperNetworkNames, Networks} from './index.js';

export function generateDeployFile(updateDate: string, updates: AllUpdates): string {
  return `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
${Object.keys(updates)
  .filter((network) => network !== 'Ethereum')
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
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](${Object.keys(updates).length});
${Object.keys(updates)
  // Avalanche payloads are not yet called from main governance
  .filter((network) => network !== 'Avalanche')
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
