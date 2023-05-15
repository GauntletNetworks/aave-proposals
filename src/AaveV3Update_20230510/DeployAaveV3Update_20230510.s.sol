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
    payloads[0] = GovHelpers.buildArbitrum(0xF4d1352b3E9E99FCa6Aa20F62Fe95192A26C9527);
    payloads[1] = GovHelpers.buildMainnet(0xfC7b55cc7C5BD3aE89aC679c7250AB30754C5cC5);
    payloads[2] = GovHelpers.buildPolygon(0x1Cdb984008dcEe9d06c28654ed31cf82680EeA62);
    payloads[3] = GovHelpers.buildOptimism(0xaC63290BC16fBc33353b14f139cEf1c660ba56F0);
    GovHelpers.createProposal(payloads, 0x16eb4b2816ebae6591136eb3c36e58bd1c92a2d1603c04ecce25a7ac07732573);
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
