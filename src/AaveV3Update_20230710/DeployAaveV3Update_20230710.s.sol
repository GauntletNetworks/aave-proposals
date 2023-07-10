// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  OptimismScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3EthereumUpdate20230710Payload,
  AaveV3OptimismUpdate20230710Payload
} from './AaveV3Update_20230710.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](2);
    payloads[0] = GovHelpers.buildMainnet(0x2ee993533a482fe0f22d0FdF1B84AE1a0537E5ed);
    payloads[1] = GovHelpers.buildOptimism(0xE1Dd796dBEB5A67CE37CbC52dCD164D0535c901E);
    GovHelpers.createProposal(payloads, 0x73fbf4d3b8dd87a2dd8d28ad0a6ca5b20a1767391950e07fe763d2d59d3af5ad);
  }
}

contract Deploy20230710PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230710Payload();
  }
}

contract Deploy20230710PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230710Payload();
  }
}
