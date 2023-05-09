// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  PolygonScript,
  AvalancheScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3EthereumUpdate20230507Payload,
  AaveV3PolygonUpdate20230507Payload,
  AaveV3AvalancheUpdate20230507Payload
} from './AaveV3Update_20230507.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](2);
    payloads[0] = GovHelpers.buildMainnet(0xE1Dd796dBEB5A67CE37CbC52dCD164D0535c901E);
    payloads[1] = GovHelpers.buildPolygon(0xaC63290BC16fBc33353b14f139cEf1c660ba56F0);
    GovHelpers.createProposal(payloads, 0xc89ae6bff02420c4460cae1f6fb9655aa2ea51fc372913084a9e6d1853b869ce);
  }
}

contract Deploy20230507PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230507Payload();
  }
}

contract Deploy20230507PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230507Payload();
  }
}

contract Deploy20230507PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230507Payload();
  }
}
