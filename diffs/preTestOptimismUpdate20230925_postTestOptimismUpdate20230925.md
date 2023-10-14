## Reserve changes

### Reserves altered

#### WETH ([0x4200000000000000000000000000000000000006](https://optimistic.etherscan.io/address/0x4200000000000000000000000000000000000006))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xc76EF342898f1AE7E6C4632627Df683FAD8563DD](https://optimistic.etherscan.io/address/0xc76EF342898f1AE7E6C4632627Df683FAD8563DD) | [0xF9336Bb69654fdd665AaC6618309a8cba078D8fE](https://optimistic.etherscan.io/address/0xF9336Bb69654fdd665AaC6618309a8cba078D8fE) |
| variableRateSlope1 | 3.8 % | 3.3 % |
| baseStableBorrowRate | 6.8 % | 6.3 % |
| interestRate | ![before](/.assets/25b7cbb97d2012b141455f46ee9b3f7e0e40a4b0.svg) | ![after](/.assets/0503ddc95c9ff90b6308f1ba4175b90d670e81ed.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x4200000000000000000000000000000000000006": {
      "interestRateStrategy": {
        "from": "0xc76EF342898f1AE7E6C4632627Df683FAD8563DD",
        "to": "0xF9336Bb69654fdd665AaC6618309a8cba078D8fE"
      }
    }
  },
  "strategies": {
    "0xF9336Bb69654fdd665AaC6618309a8cba078D8fE": {
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