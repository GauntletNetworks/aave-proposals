// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IEngine,EngineFlags,Rates} from 'aave-helpers/v3-config-engine/AaveV3PayloadBase.sol';
import {
  AaveV3PayloadArbitrum,
  AaveV3ArbitrumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {
  AaveV3PayloadEthereum,
  AaveV3EthereumAssets
} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';

import {AaveV2PayloadEthereum} from 'aave-helpers/v2-config-engine/AaveV2PayloadEthereum.sol';
import {AaveV2Ethereum, AaveV2EthereumAssets, ILendingPoolConfigurator} from 'aave-address-book/AaveV2Ethereum.sol';

contract AaveV3ArbitrumUpdate20230724Payload is AaveV3PayloadArbitrum {
  function collateralsUpdates() public pure override returns (IEngine.CollateralUpdate[] memory) {
    IEngine.CollateralUpdate[] memory collateralUpdates = new IEngine.CollateralUpdate[](1);

    collateralUpdates[0] = IEngine.CollateralUpdate({
      asset: AaveV3ArbitrumAssets.LINK_UNDERLYING,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: 7750,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT,
      eModeCategory: EngineFlags.KEEP_CURRENT
    });

    return collateralUpdates;
  }
}

contract AaveV3EthereumUpdate20230724Payload is AaveV3PayloadEthereum {
  function collateralsUpdates() public pure override returns (IEngine.CollateralUpdate[] memory) {
    IEngine.CollateralUpdate[] memory collateralUpdates = new IEngine.CollateralUpdate[](3);

    collateralUpdates[0] = IEngine.CollateralUpdate({
      asset: AaveV3EthereumAssets.DAI_UNDERLYING,
      ltv: 7700,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT,
      eModeCategory: EngineFlags.KEEP_CURRENT
    });

    collateralUpdates[1] = IEngine.CollateralUpdate({
      asset: AaveV3EthereumAssets.USDC_UNDERLYING,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: 8000,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT,
      eModeCategory: EngineFlags.KEEP_CURRENT
    });

    collateralUpdates[2] = IEngine.CollateralUpdate({
      asset: AaveV3EthereumAssets.wstETH_UNDERLYING,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: 6_00,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT,
      eModeCategory: EngineFlags.KEEP_CURRENT
    });

    return collateralUpdates;
  }
}

contract AaveV2EthereumUpdate20230724Payload is AaveV2PayloadEthereum {
  function _postExecute() internal override {
    ILendingPoolConfigurator(AaveV2Ethereum.POOL_CONFIGURATOR).configureReserveAsCollateral(
      AaveV2EthereumAssets.SNX_UNDERLYING, // asset
      46_00, // ltv
      59_00, // liq threshold
      107_50 // liq bonus
    );
  }
}
