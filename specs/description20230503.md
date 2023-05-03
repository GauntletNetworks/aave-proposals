---
aip: 215
title: Gauntlet Recommendations for Polygon V3 and Arbitrum V3
author: Paul Lei, Nick Del Zingaro, Jonathan Reem, Nick Cannon, Nathan Lord, Watson Fu, Walter Li, Sarah Chen
discussions: https://governance.aave.com/t/arc-gauntlet-recommendations-for-polygon-v3-and-arbitrum-v3/12919
---

## Simple Summary

The supply and borrow caps have been exceeded by the following assets, surpassing the 75% threshold.

- BAL supply (92.4%) and borrow (76%) caps on Polygon v3.
- EURS supply (78.4%) and borrow (78%) on Arbitrum v3.

In accordance to our Borrow and Supply Cap methodology, Gauntlet would like to raise the caps of the above assets to the following.


#### Arbitrum v3
|      | Current Supply Cap | Recommended Supply Cap | Current Borrow Cap | Recommended Borrow Cap |
| ---- | ------------------ | ---------------------- | ------------------ | ---------------------- |
| EURS | 60,000              | 65,000                  | 45,000              | 65,000                  |

Our conservative methodology thresholds the caps for EURS to be 40% of the circulating supply for EURS on Arbitrum. The community can decide whether to adopt the aggressive methodology for EURS supply cap and threshold at 60% of the circulating supply, upon which the supply and the borrow caps will be raised to 100k.

We do not recommend changing the borrow and supply caps for BAL due to the low circulating supply (~525k) of BAL on Polygon, and to prevent excess concentration risk for the protocol (currently ~70%)

## Specifications
---

### EURS Arbitrum v3
![](https://i.imgur.com/n5A7KZ6.png)
![](https://i.imgur.com/4cYJE0J.png)


![](https://i.imgur.com/Z4vUkym.png)
![](https://i.imgur.com/iyxTBcB.png)


## Implementation

This proposal implements changes on Aave V3 Arbitrum via the following pre-deployed payload:
  - Arbitrum: [`0x6bce15b789e537f3aba3c60cb183f0e8737f05ec`](https://arbiscan.io/address/0x6bce15b789e537f3aba3c60cb183f0e8737f05ec)


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos. This message is for informational purposes only and does not constitute an offer to sell, a solicitation to buy, or a recommendation for any security, nor does it constitute an offer to provide investment advisory or other services by Gauntlet Networks Inc. No reference to any specific security constitutes a recommendation to buy, sell or hold that security or any other security. Nothing in this report shall be considered a solicitation or offer to buy or sell any security, future, option or other financial instrument or to offer or provide any investment advice or service to any person in any jurisdiction. Nothing contained in this report constitutes investment advice or offers any opinion with respect to the suitability of any security, and the views expressed in this report should not be taken as advice to buy, sell or hold any security. The information in this report should not be relied upon for the purpose of investing. In preparing the information contained in this report, we have not taken into account the investment needs, objectives and financial circumstances of any particular investor. This information has no regard to the specific investment objectives, financial situation and particular needs of any specific recipient of this information and investments discussed may not be suitable for all investors. Any views expressed in this report by us were prepared based upon the information available to us at the time such views were written. Changed or additional information could cause such views to change. All information is subject to possible correction. Information may quickly become unreliable for various reasons, including changes in market conditions or economic circumstances.*