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
  AaveV3ArbitrumUpdate20230913Payload,
  AaveV3OptimismUpdate20230913Payload,
  AaveV3PolygonUpdate20230913Payload,
  AaveV3AvalancheUpdate20230913Payload
} from './AaveV3Update_20230913.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(address(0));
    payloads[1] = GovHelpers.buildOptimism(address(0));
    payloads[2] = GovHelpers.buildPolygon(address(0));
    GovHelpers.createProposal(payloads, '');
  }
}

contract Deploy20230913PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230913Payload();
  }
}