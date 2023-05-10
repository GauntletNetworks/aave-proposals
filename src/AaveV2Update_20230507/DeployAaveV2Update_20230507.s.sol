// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  PolygonScript,
  AvalancheScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV2EthereumUpdate20230507Payload,
  AaveV2PolygonUpdate20230507Payload,
  AaveV2AvalancheUpdate20230507Payload
} from './AaveV2Update_20230507.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](2);
    payloads[0] = GovHelpers.buildMainnet(0x24bdAcf6bbEBAf567123Da16CDb79A266597e92B);
    payloads[1] = GovHelpers.buildPolygon(0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8);
    GovHelpers.createProposal(payloads, 0x6a96992b967855038741da685558e17d2f167dee2b41af0154d31499a574b940);
  }
}

contract Deploy20230507PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV2EthereumUpdate20230507Payload();
  }
}

contract Deploy20230507PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV2PolygonUpdate20230507Payload();
  }
}

contract Deploy20230507PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV2AvalancheUpdate20230507Payload();
  }
}
