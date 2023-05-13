// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3EthereumUpdate20230509Payload
} from './AaveV3Update_20230509.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildMainnet(0x0568a3aeb8E78262dEFf75ee68fAC20ae35ffA91);
    GovHelpers.createProposal(payloads, 0x37e7b80ec62a713b147db9c55d9cbd6b781ec16f38c7b4a4eaeaece7dc0fffae);
  }
}

contract Deploy20230509PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230509Payload();
  }
}
