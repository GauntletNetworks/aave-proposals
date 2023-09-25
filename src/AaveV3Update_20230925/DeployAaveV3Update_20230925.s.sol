// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  OptimismScript,
  PolygonScript,
  AvalancheScript,
  MetisScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230925Payload,
  AaveV3OptimismUpdate20230925Payload,
  AaveV3PolygonUpdate20230925Payload,
  AaveV3AvalancheUpdate20230925Payload,
  AaveV3MetisUpdate20230925Payload
} from './AaveV3Update_20230925.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](4);
    payloads[0] = GovHelpers.buildArbitrum(0x1Cdb984008dcEe9d06c28654ed31cf82680EeA62);
    payloads[1] = GovHelpers.buildOptimism(0xfC7b55cc7C5BD3aE89aC679c7250AB30754C5cC5);
    payloads[2] = GovHelpers.buildPolygon(0x7aa759A57c6b039A93e93683FacD14209EE9A3DD);
    payloads[3] = GovHelpers.buildMetis(0x03232b5ee80369A88620615f8328BeEC1884b731);
    GovHelpers.createProposal(payloads, 0x813261d85ca6092337de2d636c5cddac499b0db3fe19a823062b45fcc19719da);
  }
}

contract Deploy20230925PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230925Payload();
  }
}

contract Deploy20230925PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230925Payload();
  }
}

contract Deploy20230925PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230925Payload();
  }
}

contract Deploy20230925PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230925Payload();
  }
}

contract Deploy20230925PayloadMetis is MetisScript {
  function run() external broadcast {
    new AaveV3MetisUpdate20230925Payload();
  }
}
