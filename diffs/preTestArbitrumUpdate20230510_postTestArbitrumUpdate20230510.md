## Reserve changes

### Reserve altered

#### WBTC ([0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f](https://https://arbiscan.io/address/0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x9b34E3e183c9b0d1a08fF57a8fb59c821616295f](https://https://arbiscan.io/address/0x9b34E3e183c9b0d1a08fF57a8fb59c821616295f) | [0xd9d85499449f26d2A2c240defd75314f23920089](https://https://arbiscan.io/address/0xd9d85499449f26d2A2c240defd75314f23920089) |
| variableRateSlope1 | 7 % | 4 % |
| baseStableBorrowRate | 9 % | 6 % |
| interestRate | ![before](/.assets/19b2f23d55d76d891e7d30c29aa97741efed9d17.svg) | ![after](/.assets/2c7dedb9c0cda4f69d46743b5137df8d3fa9ce57.svg) |

#### EURS ([0xD22a58f79e9481D1a88e00c343885A588b34b68B](https://https://arbiscan.io/address/0xD22a58f79e9481D1a88e00c343885A588b34b68B))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xA9F3C3caE095527061e6d270DBE163693e6fda9D](https://https://arbiscan.io/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D) | [0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E](https://https://arbiscan.io/address/0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E) |
| variableRateSlope1 | 4 % | 6 % |
| baseStableBorrowRate | 5 % | 7 % |
| interestRate | ![before](/.assets/8d9de32bf30b1c9dcf71f07a13b228c69a71a4ce.svg) | ![after](/.assets/ae5f4984ec6d1aad35594fe55bd4718cc49196da.svg) |

#### USDC ([0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8](https://https://arbiscan.io/address/0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4](https://https://arbiscan.io/address/0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4) | [0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A](https://https://arbiscan.io/address/0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A) |
| variableRateSlope1 | 4 % | 3.5 % |
| baseStableBorrowRate | 5 % | 4.5 % |
| interestRate | ![before](/.assets/ea60696e57315a00b0941d7fe1bd186df779165e.svg) | ![after](/.assets/0372907d0b2f3da48f7adcaed3b1452230cd5c2b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f": {
      "interestRateStrategy": {
        "from": "0x9b34E3e183c9b0d1a08fF57a8fb59c821616295f",
        "to": "0xd9d85499449f26d2A2c240defd75314f23920089"
      }
    },
    "0xD22a58f79e9481D1a88e00c343885A588b34b68B": {
      "interestRateStrategy": {
        "from": "0xA9F3C3caE095527061e6d270DBE163693e6fda9D",
        "to": "0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E"
      }
    },
    "0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8": {
      "interestRateStrategy": {
        "from": "0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4",
        "to": "0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A"
      }
    }
  },
  "strategies": {
    "0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E": {
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
    "0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A": {
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
    },
    "0xd9d85499449f26d2A2c240defd75314f23920089": {
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
    }
  }
}
```