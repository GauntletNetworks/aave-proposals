// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  PolygonScript,
  OptimismScript,
  AvalancheScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230510Payload,
  AaveV3EthereumUpdate20230510Payload,
  AaveV3PolygonUpdate20230510Payload,
  AaveV3OptimismUpdate20230510Payload,
  AaveV3AvalancheUpdate20230510Payload
} from './AaveV3Update_20230510.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](4);
    payloads[0] = GovHelpers.buildArbitrum(address(0));
    payloads[1] = GovHelpers.buildMainnet(address(0));
    payloads[2] = GovHelpers.buildPolygon(address(0));
    payloads[3] = GovHelpers.buildOptimism(address(0));
    GovHelpers.createProposal(payloads, '');
  }
}

contract Deploy20230510PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230510Payload();
  }
}

contract Deploy20230510PayloadEthereum is EthereumScript {
  function run() external broadcast {
    new AaveV3EthereumUpdate20230510Payload();
  }
}

contract Deploy20230510PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230510Payload();
  }
}

contract Deploy20230510PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230510Payload();
  }
}

contract Deploy20230510PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230510Payload();
  }
}