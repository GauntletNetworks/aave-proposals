---
title: Freeze MAI/MIMATIC, set LTV -> 0 for Arbitrum, Avalanche, Polygon, Optimism v3
author: Paul Lei, Watson Fu, Nick Del Zingaro, Walter Li, Jonathan Reem, Nick Cannon, Sarah Chen, Dana Tung
discussions: (https://governance.aave.com/t/arfc-recommendations-for-mai-mimatic-2023-09-08/14799)
---


## Summary


Given the MAI/MIMATIC drawdown to 0.88 over the past 24 hours, after the July drawdown to 0.94, MAI/MIMATIC has been trading outside of its intended peg to $1. Gauntlet recommends freezing MAI/MIMATIC and setting MAI/MIMATIC LTV -> 0.



## Specification


| Chain | Asset | Action |
|-------|-------|-----|
| Arbitrum | MAI/MIMATIC | Freeze Reserve, set LTV -> 0
| Optimism | MAI/MIMATIC | Freeze Reserve, set LTV -> 0
| Avalanche | MAI/MIMATIC | Freeze Reserve, set LTV -> 0
| Polygon | MAI/MIMATIC | Freeze Reserve, set LTV -> 0


## Implementation

The proposal implements changes on Arbitrum, Optimism, Polygon, Avalanche v3 using the following pre-deployed payloads:
  - Optimism: [`0x24bdacf6bbebaf567123da16cdb79a266597e92b`](https://optimistic.etherscan.io/address/0x24bdacf6bbebaf567123da16cdb79a266597e92b)
  - Arbitrum: [`0xf22c8255ea615b3da6ca5cf5aecc8956bff07aa8`](https://arbiscan.io/address/0xf22c8255ea615b3da6ca5cf5aecc8956bff07aa8)
  - Polygon: [`0x2ee993533a482fe0f22d0fdf1b84ae1a0537e5ed`](https://polygonscan.com/address/0x2ee993533a482fe0f22d0fdf1b84ae1a0537e5ed)

Changes on Avalanche can be implemented using the pre-deployed steward located at [`0xc12ad8b3d242b1eddc1c8319d1d58608e67043ed`](https://snowtrace.io/address/0xc12ad8b3d242b1eddc1c8319d1d58608e67043ed)

## Disclaimer
Gauntlet has not received any compensation from any third-party in exchange for recommending any of the actions contained in this proposal.


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

*By approving this proposal, you agree that any services provided by Gauntlet shall be governed by the terms of service available at gauntlet.network/tos.*
