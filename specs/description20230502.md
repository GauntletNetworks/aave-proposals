---
title: Aave Stablecoin E-mode changes for V3 Avalanche, Optimism, Polygon, and Arbitrum
author: Paul Lei, Nick Del Zingaro, Jonathan Reem, Nick Cannon, Nathan Lord, Watson Fu, Walter Li, Sarah Chen
discussions: https://governance.aave.com/t/gauntlet-aave-v3-e-mode-methodology/12278
---

## Summary

To optimize risk/reward tradeoffs, change Stablecoin E-mode parameters to 97.5% LT, 97% LTV, 1% LB.

Please see Gauntlet's E-Mode methodology [here](https://governance.aave.com/t/gauntlet-aave-v3-e-mode-methodology/12278) for the full forum discussion.


## Motivation

On Aave V3, E-mode requires multiple considerations, including mitigating tail risks to protocols, optimizing user experience, and allowing on-chain liquidity to remain robust. E-mode, in particular, unlocks capital efficiency with specific risk tradeoffs.


## Specification

These changes apply to V3 Avalanche, Optimism, Polygon, and Arbitrum.

The complete list of updates are:
- Avalanche:
    1. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Optimism:
    1. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Polygon:
    1. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    7. Lower Stablecoin E-Mode LTV from 97% to 93%.
- Arbitrum:
    1. Lower Stablecoin E-Mode LT from 97.5% to 95%.
    4. Lower Stablecoin E-Mode LTV from 97% to 93%.

Note that the Stablecoin E-Mode LB is already 1% across all four aforementioned chains, and that Stablecoin E-Mode has category ID = 1 across all four aforementioned chains.

We recommend that users adjust their positions accordingly.

## Implementation

The proposal implements changes on Aave V3 Optimism, Polygon, and Arbitrum using the following pre-deployed payloads:
  - Optimism: [`0xf22c8255ea615b3da6ca5cf5aecc8956bff07aa8`](https://optimistic.etherscan.io/address/0xf22c8255ea615b3da6ca5cf5aecc8956bff07aa8)
  - Arbitrum: [`0x142dcaec322aaa25141b2597bf348487adbd596d`](https://arbiscan.io/address/0x142dcaec322aaa25141b2597bf348487adbd596d)
  - Polygon: [`0x24bdacf6bbebaf567123da16cdb79a266597e92b`](https://polygonscan.com/address/0x24bdacf6bbebaf567123da16cdb79a266597e92b)

Changes on Avalanche can be implemented using the pre-deployed steward located at [`0xfc7b55cc7c5bd3ae89ac679c7250ab30754c5cc5`](https://snowtrace.io/address/0xfc7b55cc7c5bd3ae89ac679c7250ab30754c5cc5)


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
