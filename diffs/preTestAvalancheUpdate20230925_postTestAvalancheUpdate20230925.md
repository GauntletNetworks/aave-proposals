## Reserve changes

### Reserves altered

#### WETH.e ([0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB](https://snowtrace.io/address/0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x271f5f8325051f22caDa18FfedD4a805584a232A](https://snowtrace.io/address/0x271f5f8325051f22caDa18FfedD4a805584a232A) | [0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17](https://snowtrace.io/address/0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17) |
| variableRateSlope1 | 3.8 % | 3.3 % |
| baseStableBorrowRate | 6.8 % | 6.3 % |
| interestRate | ![before](/.assets/25b7cbb97d2012b141455f46ee9b3f7e0e40a4b0.svg) | ![after](/.assets/0503ddc95c9ff90b6308f1ba4175b90d670e81ed.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB": {
      "interestRateStrategy": {
        "from": "0x271f5f8325051f22caDa18FfedD4a805584a232A",
        "to": "0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17"
      }
    }
  },
  "strategies": {
    "0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17": {
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