## Reserve changes

### Reserves altered

#### WETH ([0x420000000000000000000000000000000000000A](https://andromeda-explorer.metis.io/address/0x420000000000000000000000000000000000000A))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x83e654d42f437915bf849dE04c19AAd8C5e8c01E](https://andromeda-explorer.metis.io/address/0x83e654d42f437915bf849dE04c19AAd8C5e8c01E) | [0x3c8DF161A59F2a3ed4D40F073395d6a0f14290C0](https://andromeda-explorer.metis.io/address/0x3c8DF161A59F2a3ed4D40F073395d6a0f14290C0) |
| variableRateSlope1 | 3.8 % | 3.3 % |
| baseStableBorrowRate | 6.8 % | 6.3 % |
| interestRate | ![before](/.assets/cf7a7aa4b568d8cd90f169e1d287fe4bd4355746.svg) | ![after](/.assets/666d1ff4b69856ea4344635068e8ee5b13491dd3.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x420000000000000000000000000000000000000A": {
      "interestRateStrategy": {
        "from": "0x83e654d42f437915bf849dE04c19AAd8C5e8c01E",
        "to": "0x3c8DF161A59F2a3ed4D40F073395d6a0f14290C0"
      }
    }
  },
  "strategies": {
    "0x3c8DF161A59F2a3ed4D40F073395d6a0f14290C0": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "63000000000000000000000000",
        "baseVariableBorrowRate": "10000000000000000000000000",
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "38000000000000000000000000",
        "stableRateSlope2": "800000000000000000000000000",
        "variableRateSlope1": "33000000000000000000000000",
        "variableRateSlope2": "800000000000000000000000000"
      }
    }
  }
}
```