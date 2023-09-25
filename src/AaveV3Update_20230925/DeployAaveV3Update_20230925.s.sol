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
    payloads[0] = GovHelpers.buildArbitrum(address(0));
    payloads[1] = GovHelpers.buildOptimism(address(0));
    payloads[2] = GovHelpers.buildPolygon(address(0));
    payloads[3] = GovHelpers.buildMetis(address(0));
    GovHelpers.createProposal(payloads, '');
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