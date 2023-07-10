---
title: Gauntlet Cap Updates for Ethereum, Optimism Aave v3
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Dana Tung, Aaruran Chandrasekhar
discussions: [https://governance.aave.com/t/arfc-gauntlet-supply-cap-updates-for-ethereum-v3-optimism-v3-2023-07-05/13917]
---

## Summary

Gauntlet recommends cap changes on Ethereum v3 and Optimism v3. For more details, see the full forum post [here]((https://governance.aave.com/t/arfc-gauntlet-supply-cap-updates-for-ethereum-v3-optimism-v3-2023-07-05/13917)).


## Motivation

Cap usages have been historically low and liquidity has declined for several assets - we recommend lowering caps to reduce tail risks. Our [dashboard](https://risk.gauntlet.network/protocols/aave/markets/ethereum/assets/bal) has more color on how caps have continuously evolved over the past few months.


## Specification

| Chain | Asset | Cap | Current | Recommended |
|-------|-------|-----|---------|-------------|
| Ethereum | BAL | SUPPLY | 700000 | 350000 |
| Ethereum | LINK | SUPPLY | 24000000 | 15000000 |
| Optimism | OP | SUPPLY | 20000000 | 10000000 |

## Implementation

The proposal implements changes on Ethereum v3 and Optimism v3 using the following pre-deployed payloads:
  - Ethereum: [`0x2ee993533a482fe0f22d0FdF1B84AE1a0537E5ed`](https://etherscan.io/address/0x2ee993533a482fe0f22d0FdF1B84AE1a0537E5ed)
  - Optimism: [`0xE1Dd796dBEB5A67CE37CbC52dCD164D0535c901E`](https://optimistic.etherscan.io/address/0xE1Dd796dBEB5A67CE37CbC52dCD164D0535c901E)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*
