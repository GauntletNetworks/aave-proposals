## Reserve changes

### Reserves altered

#### WETH ([0x82aF49447D8a07e3bd95BD0d56f35241523fBab1](https://arbiscan.io/address/0x82aF49447D8a07e3bd95BD0d56f35241523fBab1))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x27eFE5db315b71753b2a38ED3d5dd7E9362ba93F](https://arbiscan.io/address/0x27eFE5db315b71753b2a38ED3d5dd7E9362ba93F) | [0xdef8F50155A6cf21181E29E400E8CffAE2d50968](https://arbiscan.io/address/0xdef8F50155A6cf21181E29E400E8CffAE2d50968) |
| variableRateSlope1 | 3.8 % | 3.3 % |
| baseStableBorrowRate | 6.8 % | 6.3 % |
| interestRate | ![before](/.assets/25b7cbb97d2012b141455f46ee9b3f7e0e40a4b0.svg) | ![after](/.assets/0503ddc95c9ff90b6308f1ba4175b90d670e81ed.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x82aF49447D8a07e3bd95BD0d56f35241523fBab1": {
      "interestRateStrategy": {
        "from": "0x27eFE5db315b71753b2a38ED3d5dd7E9362ba93F",
        "to": "0xdef8F50155A6cf21181E29E400E8CffAE2d50968"
      }
    }
  },
  "strategies": {
    "0xdef8F50155A6cf21181E29E400E8CffAE2d50968": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "63000000000000000000000000",
        "baseVariableBorrowRate": "10000000000000000000000000",
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "40000000000000000000000000",
        "stableRateSlope2": "800000000000000000000000000",
        "variableRateSlope1": "33000000000000000000000000",
        "variableRateSlope2": "800000000000000000000000000"
      }
    }
  }
}
```