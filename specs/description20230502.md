---
title: Aave Stablecoin E-mode changes for V3 Avalanche, Optimism, Polygon, and Arbitrum
author: Paul Lei, Nick Del Zingaro, Jonathan Reem, Nick Cannon, Nathan Lord, Watson Fu, Walter Li, Sarah Chen
discussions: https://governance.aave.com/t/gauntlet-aave-v3-e-mode-methodology/12278
---

## Summary

To optimize risk/reward tradeoffs, below are several options for the community regarding stablecoin E-Mode:
- Option 1: (Include all current assets) - 87% LT, 82% LTV, 2% LB.
- Option 2: DAI, USDC, FRAX (if already listed) at 97.5% LT, 97% LTV, 1% LB
- Option 3: DAI, USDC, FRAX (if already listed) at 95% LT, 93% LTV, 1% LB
- Option 4: Completely remove stablecoin E-mode from Aave V3

Please see Gauntlet's E-Mode methodology [here](https://governance.aave.com/t/gauntlet-aave-v3-e-mode-methodology/12278) for the full forum discussion.


## Motivation

On Aave V3, E-mode requires multiple considerations, including mitigating tail risks to protocols, optimizing user experience, and allowing on-chain liquidity to remain robust. E-mode, in particular, unlocks capital efficiency with specific risk tradeoffs.


## Specification

The community has decided on [Option 3](https://snapshot.org/#/aave.eth/proposal/0x84deca82139320b2570f04211b249e37b8a7602b4a0ed70e6fa772c9f6e94550):
* DAI, USDC, FRAX (if already listed) at 95% LT, 93% LTV, 1% LB

These changes apply to V3 Avalanche, Optimism, Polygon, and Arbitrum.

In particular, it removes all assets other than DAI, USDC, and FRAX from these stablecoin E-modes. The complete list of updates are:
- Avalanche:
    1. Remove USDT from the Stablecoin E-Mode category.
    2. Remove MAI from the Stablecoin E-Mode category.
    3. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Optimism:
    1. Remove USDT from the Stablecoin E-Mode category.
    2. Remove SUSD from the Stablecoin E-Mode category.
    3. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Polygon:
    1. Remove USDT from the Stablecoin E-Mode category.
    2. Remove EURS from the Stablecoin E-Mode category.
    3. Remove jEUR from the Stablecoin E-Mode category.
    4. Remove agEUR from the Stablecoin E-Mode category.
    5. Remove miMATIC from the Stablecoin E-Mode category.
    6. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    7. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Arbitrum:
    1. Remove USDT from the Stablecoin E-Mode category.
    2. Remove EURS from the Stablecoin E-Mode category.
    3. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.

Note that the Stablecoin E-Mode LB is already 1% across all four aforementioned chains, and that Stablecoin E-Mode has category ID = 1 across all four aforementioned chains.

[An analysis on 04/17/2023](https://docs.google.com/spreadsheets/d/1KMNr9vY6DeL7HmmNpmGPU04RPgxkpy3COI19uZXpVTw/edit?usp=sharing) yields the following liquidation impact:
| Chain | Total Collateral Liquidatable | Total Lost to Liquidation Bonus | Total Wallets Liquidatable |
| ----- | ----------------------------- | --------------------------------- | -------------------------- |
| Avalanche | $3,560,179.71 | $66,105.87 | 40 |
| Optimism | $417,557.27 | $7,957.97 | 35 |
| Polygon | $111,505.32 | $2,935.65 | 55 |
| Arbitrum | $22,369.61 | $593.74 | 31 |

We recommend that users adjust their positions accordingly.

## Implementation

The proposal implements changes on Aave V3 Optimism, Polygon, and Arbitrum using the following pre-deployed payloads:
  - Optimism: [`0x78Fe5d0427E669ba9F964C3495fF381a805a0487`](https://optimistic.etherscan.io/address/0x78Fe5d0427E669ba9F964C3495fF381a805a0487)
  - Arbitrum: [`0x33DeAc0861FD6a9235b86172AA939E79085c6f52`](https://arbiscan.io/address/0x33DeAc0861FD6a9235b86172AA939E79085c6f52)
  - Polygon: [`0x32f3A6134590fc2d9440663d35a2F0a6265F04c4`](https://polygonscan.com/address/0x32f3A6134590fc2d9440663d35a2F0a6265F04c4)

Changes on Avalanche can be implemented using the pre-deployed steward located at [`0x0568a3aeb8e78262deff75ee68fac20ae35ffa91`](https://snowtrace.io/address/0x0568a3aeb8e78262deff75ee68fac20ae35ffa91)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
