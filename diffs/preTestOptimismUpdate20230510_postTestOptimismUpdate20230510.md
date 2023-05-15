## Reserve changes

### Reserve altered

#### WBTC ([0x68f180fcCe6836688e9084f035309E29Bf0A2095](https://optimistic.etherscan.io/address/0x68f180fcCe6836688e9084f035309E29Bf0A2095))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C](https://optimistic.etherscan.io/address/0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C) | [0x354E84ec43aCD91e1C0135c3e691960E881DB4b7](https://optimistic.etherscan.io/address/0x354E84ec43aCD91e1C0135c3e691960E881DB4b7) |
| variableRateSlope1 | 7 % | 4 % |
| baseStableBorrowRate | 9 % | 6 % |
| interestRate | ![before](/.assets/19b2f23d55d76d891e7d30c29aa97741efed9d17.svg) | ![after](/.assets/2c7dedb9c0cda4f69d46743b5137df8d3fa9ce57.svg) |

#### USDC ([0x7F5c764cBc14f9669B88837ca1490cCa17c31607](https://optimistic.etherscan.io/address/0x7F5c764cBc14f9669B88837ca1490cCa17c31607))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4](https://optimistic.etherscan.io/address/0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4) | [0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398](https://optimistic.etherscan.io/address/0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398) |
| variableRateSlope1 | 4 % | 3.5 % |
| baseStableBorrowRate | 5 % | 4.5 % |
| interestRate | ![before](/.assets/ea60696e57315a00b0941d7fe1bd186df779165e.svg) | ![after](/.assets/0372907d0b2f3da48f7adcaed3b1452230cd5c2b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x68f180fcCe6836688e9084f035309E29Bf0A2095": {
      "interestRateStrategy": {
        "from": "0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C",
        "to": "0x354E84ec43aCD91e1C0135c3e691960E881DB4b7"
      }
    },
    "0x7F5c764cBc14f9669B88837ca1490cCa17c31607": {
      "interestRateStrategy": {
        "from": "0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4",
        "to": "0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398"
      }
    }
  },
  "strategies": {
    "0x354E84ec43aCD91e1C0135c3e691960E881DB4b7": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "60000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "550000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "450000000000000000000000000",
        "stableRateSlope1": 0,
        "stableRateSlope2": 0,
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    },
    "0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "45000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "100000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "900000000000000000000000000",
        "stableRateSlope1": "5000000000000000000000000",
        "stableRateSlope2": "600000000000000000000000000",
        "variableRateSlope1": "35000000000000000000000000",
        "variableRateSlope2": "600000000000000000000000000"
      }
    }
  }
}
```