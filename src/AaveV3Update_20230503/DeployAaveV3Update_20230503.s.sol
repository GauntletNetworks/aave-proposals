// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230503Payload
} from './AaveV3Update_20230503.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildArbitrum(0x6bcE15B789e537f3abA3C60CB183F0E8737f05eC);
    GovHelpers.createProposal(payloads, 0xd6c2cf5b04768c8ef63a635112fbc90cc57ec92bf5f70305c1a3f7769e8b4c51);
  }
}

contract Deploy20230503PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230503Payload();
  }
}
