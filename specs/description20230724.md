---
title: Gauntlet Risk Parameter Updates for Ethereum v3, Arbitrum v3, Ethereum v2
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Aaruran Chandrasekhar
discussions: https://governance.aave.com/t/arfc-gauntlet-risk-parameter-updates-for-ethereum-v3-arbitrum-v3-ethereum-v2-2023-06-26/13825/7?u=gauntlet
---

## Summary

Gauntlet recommends parameter changes on Ethereum v3, Arbitrum v3, Ethereum v2. For more details, see the full forum post [here]((https://governance.aave.com/t/arfc-gauntlet-risk-parameter-updates-for-ethereum-v3-arbitrum-v3-ethereum-v2-2023-06-26/13825/7?u=gauntlet)).


## Motivation

These parameter updates are a continuation of Gauntlet’s regular parameter recommendations. Our simulation engine has ingested the latest market data (outlined below) to recalibrate parameters for the Ethereum v3, Ethereum v2, and Arbitrum Aave v3 protocols.


## Specification
**Ethereum v3**
| Parameter | Current Value | Recommended Value |
| -------- | -------- | -------- |
| DAI Loan To Value | 67% | 77% |
| USDC Liquidation Threshold | 79% | 80% |
| WSTETH Liquidation Bonus | 7% | 6% |

**Arbitrum v3**
| Parameter | Current Value | Recommended Value |
| -------- | -------- | -------- |
| LINK Liquidation Threshold | 75% | 77.5% |

**Ethereum v2**
| Parameter | Current Value | Recommended Value |
| -------- | -------- | -------- |
| SNX Liquidation Threshold | 62% | 59%

## Implementation

The proposal implements changes on Ethereum v3, Arbitrum v3, Ethereum v2 using the following pre-deployed payloads:
  - Ethereum V3: [`0x0c9c38cb9480b86c1f624613749b02379b0448ce`](https://etherscan.io/address/0x0c9c38cb9480b86c1f624613749b02379b0448ce)
  - Ethereum V2: [`0xf7c3350757de224bdb2b77a3943c8667acee3d37`](https://etherscan.io/address/0xf7c3350757de224bdb2b77a3943c8667acee3d37)
  - Arbitrum V3: [`0xac63290bc16fbc33353b14f139cef1c660ba56f0`](https://arbiscan.io/address/0xac63290bc16fbc33353b14f139cef1c660ba56f0)


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
