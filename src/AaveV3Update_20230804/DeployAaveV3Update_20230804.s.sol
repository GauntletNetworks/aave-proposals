// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  PolygonScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3EthereumUpdate20230804Payload,
  AaveV3PolygonUpdate20230804Payload
} from './AaveV3Update_20230804.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](2);
    payloads[0] = GovHelpers.buildMainnet(0x7aa759A57c6b039A93e93683FacD14209EE9A3DD);
    payloads[1] = GovHelpers.buildPolygon(0xc12aD8B3D242B1EDdc1C8319D1d58608E67043eD);
    GovHelpers.createProposal(payloads, 0x4940eb2481c308072d4e2431c167477918e48edf25551c54bdac13d1f78d8497);
  }
}

contract Deploy20230804PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230804Payload();
  }
}

contract Deploy20230804PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230804Payload();
  }
}
