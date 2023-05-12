## Reserve changes

### Reserve altered

#### CRV ([0x172370d5Cd63279eFa6d502DAB29171933a610AF](https://polygonscan.com/address/0x172370d5Cd63279eFa6d502DAB29171933a610AF))

| description | value before | value after |
| --- | --- | --- |
| reserveFactor | 20 % | 35 % |


#### WBTC ([0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6](https://polygonscan.com/address/0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x03733F4E008d36f2e37F0080fF1c8DF756622E6F](https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F) | [0x8F183Ee74C790CB558232a141099b316D6C8Ba6E](https://polygonscan.com/address/0x8F183Ee74C790CB558232a141099b316D6C8Ba6E) |
| variableRateSlope1 | 7 % | 4 % |
| baseStableBorrowRate | 9 % | 6 % |
| interestRate | ![before](/.assets/19b2f23d55d76d891e7d30c29aa97741efed9d17.svg) | ![after](/.assets/2c7dedb9c0cda4f69d46743b5137df8d3fa9ce57.svg) |

#### USDC ([0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174](https://polygonscan.com/address/0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4](https://polygonscan.com/address/0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4) | [0xd9d85499449f26d2A2c240defd75314f23920089](https://polygonscan.com/address/0xd9d85499449f26d2A2c240defd75314f23920089) |
| variableRateSlope1 | 4 % | 3.5 % |
| baseStableBorrowRate | 5 % | 4.5 % |
| interestRate | ![before](/.assets/ea60696e57315a00b0941d7fe1bd186df779165e.svg) | ![after](/.assets/0372907d0b2f3da48f7adcaed3b1452230cd5c2b.svg) |

#### DPI ([0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369](https://polygonscan.com/address/0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x03733F4E008d36f2e37F0080fF1c8DF756622E6F](https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F) | [0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E](https://polygonscan.com/address/0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E) |
| variableRateSlope1 | 7 % | 10 % |
| baseStableBorrowRate | 9 % | 12 % |
| interestRate | ![before](/.assets/19b2f23d55d76d891e7d30c29aa97741efed9d17.svg) | ![after](/.assets/ecca0fc5726ac8611b08586ad4640ef858267770.svg) |

#### EURS ([0xE111178A87A3BFf0c8d18DECBa5798827539Ae99](https://polygonscan.com/address/0xE111178A87A3BFf0c8d18DECBa5798827539Ae99))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xA9F3C3caE095527061e6d270DBE163693e6fda9D](https://polygonscan.com/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D) | [0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A](https://polygonscan.com/address/0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A) |
| variableRateSlope1 | 4 % | 6 % |
| baseStableBorrowRate | 5 % | 7 % |
| interestRate | ![before](/.assets/8d9de32bf30b1c9dcf71f07a13b228c69a71a4ce.svg) | ![after](/.assets/ae5f4984ec6d1aad35594fe55bd4718cc49196da.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x172370d5Cd63279eFa6d502DAB29171933a610AF": {
      "reserveFactor": {
        "from": 2000,
        "to": 3500
      }
    },
    "0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6": {
      "interestRateStrategy": {
        "from": "0x03733F4E008d36f2e37F0080fF1c8DF756622E6F",
        "to": "0x8F183Ee74C790CB558232a141099b316D6C8Ba6E"
      }
    },
    "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174": {
      "interestRateStrategy": {
        "from": "0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4",
        "to": "0xd9d85499449f26d2A2c240defd75314f23920089"
      }
    },
    "0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369": {
      "interestRateStrategy": {
        "from": "0x03733F4E008d36f2e37F0080fF1c8DF756622E6F",
        "to": "0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E"
      }
    },
    "0xE111178A87A3BFf0c8d18DECBa5798827539Ae99": {
      "interestRateStrategy": {
        "from": "0xA9F3C3caE095527061e6d270DBE163693e6fda9D",
        "to": "0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A"
      }
    }
  },
  "strategies": {
    "0x8F183Ee74C790CB558232a141099b316D6C8Ba6E": {
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
    "0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "120000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "550000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "450000000000000000000000000",
        "stableRateSlope1": 0,
        "stableRateSlope2": 0,
        "variableRateSlope1": "100000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    },
    "0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "70000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "5000000000000000000000000",
        "stableRateSlope2": "750000000000000000000000000",
        "variableRateSlope1": "60000000000000000000000000",
        "variableRateSlope2": "750000000000000000000000000"
      }
    },
    "0xd9d85499449f26d2A2c240defd75314f23920089": {
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