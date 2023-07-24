// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  ArbitrumScript,
  EthereumScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230724Payload,
  AaveV3EthereumUpdate20230724Payload,
  AaveV2EthereumUpdate20230724Payload
} from './AaveV3Update_20230724.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(address(0));
    payloads[1] = GovHelpers.buildMainnet(address(0));
    payloads[2] = GovHelpers.buildMainnet(address(0));
    GovHelpers.createProposal(payloads, '');
  }
}

contract Deploy20230724PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230724Payload();
  }
}

contract Deploy20230724PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230724Payload();
  }
}

contract Deploy20230724PayloadEthereumV2 is EthereumScript {
  function run() external broadcast {
    new AaveV2EthereumUpdate20230724Payload();
  }
}
