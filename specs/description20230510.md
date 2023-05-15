---
title: Aave V3 Interest Rate Curve Changes (4/27)
author: Paul Lei, Nick Egan, Watson Fu, Nick Del Zingaro, Jonathan Reem, Nick Cannon, Nathan Lord, Sarah Chen
discussions: https://governance.aave.com/t/arfc-aave-v3-interest-rate-curve-recommendations-from-gauntlet-2023-04-27/12921
---


## Summary

A proposal to make parameter changes on the Ethereum, Polygon, Avalanche, Arbitrum, and Optimism Aave V3 markets. For more details, see the full forum post [here](https://governance.aave.com/t/arfc-aave-v3-interest-rate-curve-recommendations-from-gauntlet-2023-04-27/12921).


## Motivation

Given the significant shifts in crypto markets, Gauntlet’s platform has evaluated all assets on Aave V3’s active markets and has identified opportunities to adjust parameters for certain assets for the benefit of the protocol. Our methodology makes data-informed decisions around setting borrower and supplier interest rates when market conditions require the protocol to reduce risk or when strategic opportunities present themselves to increase protocol revenue without materially impacting risk. This analysis further finetunes the interest rate curves of Aave V3 across the Ethereum, Polygon, Avalanche, Arbitrum, and Optimism markets.


## Specification

Aave V3 Ethereum

|                    | CRV            | USDC             | USDT            | WBTC            |
|:-------------------|:---------------|:-----------------|:----------------|:----------------|
| Optimal            | 0.7            | 0.9              | **0.9 → 0.8**   | 0.45            |
| Variable Base      | 0.03           | 0.0              | 0.0             | 0.0             |
| Variable Slope 1   | 0.14           | **0.04 → 0.035** | 0.04            | **0.07 → 0.04** |
| Variable Slope 2   | 3.0            | 0.6              | **0.72 → 0.75** | 3.0             |
| Stable Base Offset | 0.03           | 0.01             | 0.01            | 0.02            |
| Stable Slope 1     | 0.08           | 0.005            | 0.04            | 0.07            |
| Stable Slope 2     | 3.0            | 0.6              | 0.72            | 3.0             |
| Reserve Factor     | **0.2 → 0.35** | 0.1              | 0.1             | 0.2             |

Aave V3 Polygon

|                    | CRV            | DPI            | EURS            | USDC             | WBTC            |
|:-------------------|:---------------|:---------------|:----------------|:-----------------|:----------------|
| Optimal            | 0.7            | 0.45           | 0.8             | 0.9              | 0.45            |
| Variable Base      | 0.03           | 0.0            | 0.0             | 0.0              | 0.0             |
| Variable Slope 1   | 0.14           | **0.07 → 0.1** | **0.04 → 0.06** | **0.04 → 0.035** | **0.07 → 0.04** |
| Variable Slope 2   | 3.0            | 3.0            | 0.75            | 0.6              | 3.0             |
| Stable Base Offset | 0.03           | 0.02           | 0.01            | 0.01             | 0.02            |
| Stable Slope 1     | 0.08           | 0.0            | 0.005           | 0.005            | 0.0             |
| Stable Slope 2     | 3.0            | 0.0            | 0.75            | 0.6              | 0.0             |
| Reserve Factor     | **0.2 → 0.35** | 0.35           | 0.1             | 0.1              | 0.2             |

Aave V3 Avalanche

|                    | USDC             | WBTC            |
|:-------------------|:-----------------|:----------------|
| Optimal            | 0.9              | 0.45            |
| Variable Base      | 0.0              | 0.0             |
| Variable Slope 1   | **0.04 → 0.035** | **0.07 → 0.04** |
| Variable Slope 2   | 0.6              | 3.0             |
| Stable Base Offset | 0.01             | 0.02            |
| Stable Slope 1     | 0.005            | 0.0             |
| Stable Slope 2     | 0.6              | 0.0             |
| Reserve Factor     | 0.1              | 0.2             |

Aave V3 Arbitrum

|                    | EURS            | USDC             | WBTC            |
|:-------------------|:----------------|:-----------------|:----------------|
| Optimal            | 0.8             | 0.9              | 0.45            |
| Variable Base      | 0.0             | 0.0              | 0.0             |
| Variable Slope 1   | **0.04 → 0.06** | **0.04 → 0.035** | **0.07 → 0.04** |
| Variable Slope 2   | 0.75            | 0.6              | 3.0             |
| Stable Base Offset | 0.01            | 0.01             | 0.02            |
| Stable Slope 1     | 0.005           | 0.005            | 0.0             |
| Stable Slope 2     | 0.75            | 0.6              | 0.0             |
| Reserve Factor     | 0.1             | 0.1              | 0.2             |

Aave V3 Optimism

|                    | USDC             | WBTC            |
|:-------------------|:-----------------|:----------------|
| Optimal            | 0.9              | 0.45            |
| Variable Base      | 0.0              | 0.0             |
| Variable Slope 1   | **0.04 → 0.035** | **0.07 → 0.04** |
| Variable Slope 2   | 0.6              | 3.0             |
| Stable Base Offset | 0.01             | 0.02            |
| Stable Slope 1     | 0.005            | 0.0             |
| Stable Slope 2     | 0.6              | 0.0             |
| Reserve Factor     | 0.1              | 0.2             |

## Implementation

The proposal implements changes on Aave V3 Ethereum, Polygon, Arbitrum, and Optimism using the following pre-deployed payloads:
  - Ethereum: [`0xfc7b55cc7c5bd3ae89ac679c7250ab30754c5cc5`](https://etherscan.io/address/0xfc7b55cc7c5bd3ae89ac679c7250ab30754c5cc5)
  - Arbitrum: [`0xf4d1352b3e9e99fca6aa20f62fe95192a26c9527`](https://arbiscan.io/address/0xf4d1352b3e9e99fca6aa20f62fe95192a26c9527)
  - Optimism: [`0xac63290bc16fbc33353b14f139cef1c660ba56f0`](https://optimistic.etherscan.io/address/0xac63290bc16fbc33353b14f139cef1c660ba56f0
  - Polygon: [`0x1cdb984008dcee9d06c28654ed31cf82680eea62`](https://polygonscan.com/address/0x1cdb984008dcee9d06c28654ed31cf82680eea62)

Changes on Avalanche can be implemented using the pre-deployed steward located at [`0x24bdacf6bbebaf567123da16cdb79a266597e92b`](https://snowtrace.io/address/0x24bdacf6bbebaf567123da16cdb79a266597e92b)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
