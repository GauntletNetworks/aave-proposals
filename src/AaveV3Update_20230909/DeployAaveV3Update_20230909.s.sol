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
    payloads[0] = GovHelpers.buildArbitrum(0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8);
    payloads[1] = GovHelpers.buildOptimism(0x24bdAcf6bbEBAf567123Da16CDb79A266597e92B);
    payloads[2] = GovHelpers.buildPolygon(0x2ee993533a482fe0f22d0FdF1B84AE1a0537E5ed);
    GovHelpers.createProposal(payloads, 0xc74f19fc8bb41498edc38f2da7cbc45e2e6d8adb1d28e50793df07328fb56377);
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
