---
title: Gauntlet Recommendations to Lower stMATIC/MaticX non-emode LT/LTV on Polygon v3
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Dana Tung
discussions: https://governance.aave.com/t/arfc-gauntlet-recommendation-to-lower-stmatic-maticx-non-emode-lt/14859
---

## Summary

Gauntlet recommends lowering stMATIC, MaticX non-emode LT/LTV on Polygon v3 to improve the risk profile associated with MATIC LSTs.

Reducing MATIC LST non-emode LT to lower borrowing power can help combat the following.

- Risks of reduced WMATIC supply in the future, which may cause long-term growth risk for Polygon v3
- Risks of reduced capacity for recursive LST - WMATIC borrowing
- Risks associated with increased stablecoin borrowing against LST collateral, amidst decreasing MATIC LST liquidity


## Specification


| Chain | Asset | Action | Current Value | New Value
|-------|-------|-----| ---| --- |
| Polygon | stMATIC | Lower non-emode LT| 65% | 60%
| Polygon | stMATIC | Lower non-emode LTV| 50%| 45%
| Polygon | MaticX | Lower non-emode LT| 67%| 62%
| Polygon | MaticX | Lower non-emode LTV| 58%| 45%



## Implementation

The proposal implements changes on Polygon v3 using the following pre-deployed payloads:
  - Polygon

## Disclaimer

Gauntlet has not received any compensation from any third-party in exchange for recommending any of the actions contained in this proposal.

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos.*