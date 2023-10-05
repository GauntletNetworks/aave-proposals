// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  PolygonScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3PolygonUpdate20231002maticPayload
} from './AaveV3Update_20231002matic.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildPolygon(0xEe22aC75C0d128220296f6493129827a6dEa5F25);
    GovHelpers.createProposal(payloads, 0x6818588a00cd42f2f8fba47c7430e858019e7a0c41daf7711a424f992519f9fd);
  }
}

contract Deploy20231002maticPayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20231002maticPayload();
  }
}
