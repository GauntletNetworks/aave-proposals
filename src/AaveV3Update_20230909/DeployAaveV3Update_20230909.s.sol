// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  OptimismScript,
  PolygonScript,
  AvalancheScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230909Payload,
  AaveV3OptimismUpdate20230909Payload,
  AaveV3PolygonUpdate20230909Payload,
  AaveV3AvalancheUpdate20230909Payload
} from './AaveV3Update_20230909.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(address(0));
    payloads[1] = GovHelpers.buildOptimism(address(0));
    payloads[2] = GovHelpers.buildPolygon(address(0));
    GovHelpers.createProposal(payloads, '');
  }
}

contract Deploy20230909PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230909Payload();
  }
}

contract Deploy20230909PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230909Payload();
  }
}

contract Deploy20230909PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230909Payload();
  }
}

contract Deploy20230909PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230909Payload();
  }
}