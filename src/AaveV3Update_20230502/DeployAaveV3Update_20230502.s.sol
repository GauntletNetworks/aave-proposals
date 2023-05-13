// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  PolygonScript,
  AvalancheScript,
  OptimismScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230502Payload,
  AaveV3PolygonUpdate20230502Payload,
  AaveV3AvalancheUpdate20230502Payload,
  AaveV3OptimismUpdate20230502Payload
} from './AaveV3Update_20230502.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(0x33DeAc0861FD6a9235b86172AA939E79085c6f52);
    payloads[1] = GovHelpers.buildPolygon(0x32f3A6134590fc2d9440663d35a2F0a6265F04c4);
    payloads[2] = GovHelpers.buildOptimism(0x78Fe5d0427E669ba9F964C3495fF381a805a0487);
    GovHelpers.createProposal(payloads, 0x0e56a7eefb6a7519c060010e526c4a0267eee6bf0dfa37bf86438d2ca9ed66f0);
  }
}

contract Deploy20230502PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230502Payload();
  }
}
