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
    payloads[0] = GovHelpers.buildMainnet(address(0));
    payloads[1] = GovHelpers.buildPolygon(address(0));
    GovHelpers.createProposal(payloads, '');
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
