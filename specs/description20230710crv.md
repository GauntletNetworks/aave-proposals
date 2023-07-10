---
title: Gauntlet Cap Updates for CRV on Ethereum v3
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Dana Tung, Aaruran Chandrasekhar
discussions: [https://governance.aave.com/t/arfc-gauntlet-borrow-cap-updates-for-crv-on-ethereum-v3-2023-07-06/13918]
---


## Summary

Gauntlet recommends borrow cap changes to CRV on Ethereum v3. For more details, see the full forum post [here]((https://governance.aave.com/t/arfc-gauntlet-borrow-cap-updates-for-crv-on-ethereum-v3-2023-07-06/13918)).


## Motivation

CRV borrow cap usages have been historically low - we recommend lowering caps to reduce tail risks. Our [dashboard](https://risk.gauntlet.network/protocols/aave/markets/ethereum/assets/crv) has more color on how CRV borrow cap usage has been < 25% for the past three months.


## Specification

| Chain | Asset | Cap | Current | Recommended |
|-------|-------|-----|---------|-------------|
| Ethereum | CRV | BORROW | 7700000 | 3800000 |

## Implementation

The proposal implements changes on Ethereum v3 using the following pre-deployed payload:
  - Ethereum: [`0xf8bC2a699559c96D48cf1e6F70aa2e67508C2aE9`](https://etherscan.io/address/0xf8bC2a699559c96D48cf1e6F70aa2e67508C2aE9)


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
