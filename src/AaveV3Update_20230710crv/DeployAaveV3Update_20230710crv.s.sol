// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3EthereumUpdate20230710crvPayload
} from './AaveV3Update_20230710crv.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildMainnet(0xf8bC2a699559c96D48cf1e6F70aa2e67508C2aE9);
    GovHelpers.createProposal(payloads, 0xfdec8fddb48318bc1936c54346a8e9369cb804af35b994a063352b48c5af51d5);
  }
}

contract Deploy20230710crvPayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230710crvPayload();
  }
}
