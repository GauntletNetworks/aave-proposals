// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'aave-helpers/v3-config-engine/AaveV3PayloadAvalanche.sol';
import {IACLManager} from 'aave-address-book/AaveV3.sol';
/**
 * @dev Guardian steward that updates rates, reserve factors, and caps on aave v3 avalanche
 * Covers changes from the following two snapshot votes:
 *   - https://snapshot.org/#/aave.eth/proposal/0xbda28d65ca4d64005e6019948ed52d9d62c9e73e356ab1013aa2d4829f40c735
 *   - https://snapshot.org/#/aave.eth/proposal/0x833eca942053ffcaecbedd6c3b0d5f2392f1ad868e57f1babe9b40a2afedaaa3
 * @author Gauntlet Networks
 */
contract AaveV3AvaRatesUpdatesSteward_20230331 is AaveV3PayloadAvalanche {
  function _postExecute() internal override {
    IACLManager aclManager = AaveV3Avalanche.ACL_MANAGER;

    aclManager.renounceRole(
      aclManager.RISK_ADMIN_ROLE(),
      address(this)
    );
  }

  function capsUpdates() public pure override returns (IEngine.CapsUpdate[] memory) {
    IEngine.CapsUpdate[] memory capsUpdate = new IEngine.CapsUpdate[](4);

    capsUpdate[0] = IEngine.CapsUpdate({
      asset: AaveV3AvalancheAssets.BTCb_UNDERLYING,
      supplyCap: 3_000,
      borrowCap: 900
    });

    capsUpdate[1] = IEngine.CapsUpdate({
      asset: AaveV3AvalancheAssets.USDC_UNDERLYING,
      supplyCap: 170_000_000,
      borrowCap: 90_000_000
    });

    capsUpdate[2] = IEngine.CapsUpdate({
      asset: AaveV3AvalancheAssets.WAVAX_UNDERLYING,
      supplyCap: EngineFlags.KEEP_CURRENT,
      borrowCap: 3_000_000
    });

    capsUpdate[3] = IEngine.CapsUpdate({
      asset: AaveV3AvalancheAssets.DAIe_UNDERLYING,
      supplyCap: 17_000_000,
      borrowCap: 17_000_000
    });

    return capsUpdate;
  }

  function rateStrategiesUpdates()
    public
    view
    override
    returns (IEngine.RateStrategyUpdate[] memory)
  {
    IEngine.RateStrategyUpdate[] memory ratesUpdate = new IEngine.RateStrategyUpdate[](4);

    Rates.RateStrategyParams memory usdt = LISTING_ENGINE
      .RATE_STRATEGIES_FACTORY()
      .getStrategyDataOfAsset(AaveV3AvalancheAssets.USDt_UNDERLYING);
    usdt.optimalUsageRatio = _bpsToRay(80_00);
    usdt.variableRateSlope2 = _bpsToRay(75_00);
    usdt.stableRateSlope2 = _bpsToRay(75_00);
    ratesUpdate[0] = IEngine.RateStrategyUpdate({
      asset: AaveV3AvalancheAssets.USDt_UNDERLYING,
      params: usdt
    });

    Rates.RateStrategyParams memory mai = LISTING_ENGINE
      .RATE_STRATEGIES_FACTORY()
      .getStrategyDataOfAsset(AaveV3AvalancheAssets.MAI_UNDERLYING);
    mai.optimalUsageRatio = _bpsToRay(80_00);
    mai.variableRateSlope2 = _bpsToRay(75_00);
    mai.stableRateSlope2 = _bpsToRay(75_00);
    ratesUpdate[1] = IEngine.RateStrategyUpdate({
      asset: AaveV3AvalancheAssets.MAI_UNDERLYING,
      params: usdt
    });

    ratesUpdate[2] = IEngine.RateStrategyUpdate({
      asset: AaveV3AvalancheAssets.WETHe_UNDERLYING,
      params: Rates.RateStrategyParams({
        optimalUsageRatio: _bpsToRay(80_00),
        baseVariableBorrowRate: _bpsToRay(1_00),
        variableRateSlope1: _bpsToRay(3_80),
        variableRateSlope2: _bpsToRay(80_00),
        stableRateSlope1: _bpsToRay(4_00),
        stableRateSlope2: _bpsToRay(80_00),
        baseStableRateOffset: _bpsToRay(3_00),
        stableRateExcessOffset: EngineFlags.KEEP_CURRENT,
        optimalStableToTotalDebtRatio: EngineFlags.KEEP_CURRENT
      })
    });

    Rates.RateStrategyParams memory frax = LISTING_ENGINE
      .RATE_STRATEGIES_FACTORY()
      .getStrategyDataOfAsset(AaveV3AvalancheAssets.FRAX_UNDERLYING);
    frax.optimalUsageRatio = _bpsToRay(80_00);
    frax.variableRateSlope2 = _bpsToRay(75_00);
    frax.stableRateSlope2 = _bpsToRay(75_00);
    ratesUpdate[3] = IEngine.RateStrategyUpdate({
      asset: AaveV3AvalancheAssets.FRAX_UNDERLYING,
      params: frax
    });

    return ratesUpdate;
  }

  function borrowsUpdates() public pure override returns (IEngine.BorrowUpdate[] memory) {
    IEngine.BorrowUpdate[] memory borrowsUpdate = new IEngine.BorrowUpdate[](2);

    borrowsUpdate[0] = IEngine.BorrowUpdate({
      asset: AaveV3AvalancheAssets.WETHe_UNDERLYING,
      reserveFactor: 15_00,
      enabledToBorrow: EngineFlags.KEEP_CURRENT,
      flashloanable: EngineFlags.KEEP_CURRENT,
      stableRateModeEnabled: EngineFlags.KEEP_CURRENT,
      borrowableInIsolation: EngineFlags.KEEP_CURRENT,
      withSiloedBorrowing: EngineFlags.KEEP_CURRENT
    });

    borrowsUpdate[1] = IEngine.BorrowUpdate({
      asset: AaveV3AvalancheAssets.MAI_UNDERLYING,
      reserveFactor: 20_00,
      enabledToBorrow: EngineFlags.KEEP_CURRENT,
      flashloanable: EngineFlags.KEEP_CURRENT,
      stableRateModeEnabled: EngineFlags.KEEP_CURRENT,
      borrowableInIsolation: EngineFlags.KEEP_CURRENT,
      withSiloedBorrowing: EngineFlags.KEEP_CURRENT
    });

    return borrowsUpdate;
  }
}
