---
title: Gauntlet recommendation to set WETH slope 1 to 3.3% on v3 markets, excluding Ethereum v3
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Dana Tung
discussions: https://governance.aave.com/t/gauntlet-interest-rate-recommendations-for-weth-and-wmatic-on-v2-and-v3/14588/8
---


## Summary
Gauntlet’s analysis has identified opportunities to adjust interest rate parameters for WETH on v3 markets. This will help to facilitate more Emode borrowing against LST collateral, which may
- drive additional revenue to Aave.
- adjust current risk profile for LST to depend less on onchain liquidity, which has been steadily declining over the past few months. This may be adding risk to the current borrow composition against LST collateral.


## Specification


| Chain | Asset | Action | Current Value | New Value
|-------|-------|-----| ---| --- |
| Arbitrum | WETH | Lower Variable Slope 1| 3.8% | 3.3%
| Optimism | WETH | Lower Variable Slope 1| 3.8%| 3.3%
| Polygon | WETH | Lower Variable Slope 1| 3.8%| 3.3%
| Avalanche | WETH | Lower Variable Slope 1| 3.8%| 3.3%
| Metis | WETH | Lower Variable Slope 1| 3.8%| 3.3%


## Implementation

The proposal implements changes on Arbitrum, Optimism, Polygon, Metis v3 using the following pre-deployed payloads:
 - Arbitrum: [`0x1Cdb984008dcEe9d06c28654ed31cf82680EeA62`](https://arbiscan.io/address/0x1Cdb984008dcEe9d06c28654ed31cf82680EeA62)
 - Optimism: [`0xfC7b55cc7C5BD3aE89aC679c7250AB30754C5cC5`](https://optimistic.etherscan.io/address/0xfC7b55cc7C5BD3aE89aC679c7250AB30754C5cC5)
 - Polygon: [`0x7aa759A57c6b039A93e93683FacD14209EE9A3DD`](https://polygonscan.com/address/0x7aa759A57c6b039A93e93683FacD14209EE9A3DD)
 - Metis: [`0x03232b5ee80369A88620615f8328BeEC1884b731`](https://andromeda-explorer.metis.io/address/0x03232b5ee80369A88620615f8328BeEC1884b731)
   - Note: The implementation code for Metis can be found [here](https://github.com/GauntletNetworks/aave-proposals/blob/9f57acc58d452959481cffd3f2d49b8e902680a5/src/AaveV3Update_20230925/AaveV3Update_20230925.sol)

Changes on Avalanche can be implemented using the pre-deployed steward located at: [`0x2ee993533a482fe0f22d0fdf1b84ae1a0537e5ed`](https://snowtrace.io/address/0x2ee993533a482fe0f22d0fdf1b84ae1a0537e5ed)

## Disclaimer
Gauntlet has not received any compensation from any third-party in exchange for recommending any of the actions contained in this proposal.


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos.*
