## Reserve changes

### Reserve altered

#### WBTC ([0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599](https://etherscan.io/address/0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x24701A6368Ff6D2874d6b8cDadd461552B8A5283](https://etherscan.io/address/0x24701A6368Ff6D2874d6b8cDadd461552B8A5283) | [0xC82dF96432346cFb632473eB619Db3B8AC280234](https://etherscan.io/address/0xC82dF96432346cFb632473eB619Db3B8AC280234) |
| variableRateSlope1 | 7 % | 4 % |
| baseStableBorrowRate | 9 % | 6 % |
| interestRate | ![before](/.assets/b5cb0fd07fde8594230045982589445fc02ace52.svg) | ![after](/.assets/d863762e7fefb79a105c6a1e9b93f4f7f2671ac4.svg) |

#### USDC ([0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xD6293edBB2E5E0687a79F01BEcd51A778d59D1c5](https://etherscan.io/address/0xD6293edBB2E5E0687a79F01BEcd51A778d59D1c5) | [0xd9d85499449f26d2A2c240defd75314f23920089](https://etherscan.io/address/0xd9d85499449f26d2A2c240defd75314f23920089) |
| variableRateSlope1 | 4 % | 3.5 % |
| baseStableBorrowRate | 5 % | 4.5 % |
| interestRate | ![before](/.assets/ea60696e57315a00b0941d7fe1bd186df779165e.svg) | ![after](/.assets/0372907d0b2f3da48f7adcaed3b1452230cd5c2b.svg) |

#### CRV ([0xD533a949740bb3306d119CC777fa900bA034cd52](https://etherscan.io/address/0xD533a949740bb3306d119CC777fa900bA034cd52))

| description | value before | value after |
| --- | --- | --- |
| reserveFactor | 20 % | 35 % |


#### USDT ([0xdAC17F958D2ee523a2206206994597C13D831ec7](https://etherscan.io/address/0xdAC17F958D2ee523a2206206994597C13D831ec7))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xdd1BAC6A713c5b0EC42bA39D0c5e4582975DE6D6](https://etherscan.io/address/0xdd1BAC6A713c5b0EC42bA39D0c5e4582975DE6D6) | [0x8F183Ee74C790CB558232a141099b316D6C8Ba6E](https://etherscan.io/address/0x8F183Ee74C790CB558232a141099b316D6C8Ba6E) |
| optimalUsageRatio | 90 % | 80 % |
| maxExcessUsageRatio | 10 % | 20 % |
| variableRateSlope2 | 72 % | 75 % |
| interestRate | ![before](/.assets/3bff92d2cfac98105fbeed24302d9d3577cb1325.svg) | ![after](/.assets/398a9e53757e01d6b0e762e21b88bb93cf4aa95e.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599": {
      "interestRateStrategy": {
        "from": "0x24701A6368Ff6D2874d6b8cDadd461552B8A5283",
        "to": "0xC82dF96432346cFb632473eB619Db3B8AC280234"
      }
    },
    "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48": {
      "interestRateStrategy": {
        "from": "0xD6293edBB2E5E0687a79F01BEcd51A778d59D1c5",
        "to": "0xd9d85499449f26d2A2c240defd75314f23920089"
      }
    },
    "0xD533a949740bb3306d119CC777fa900bA034cd52": {
      "reserveFactor": {
        "from": 2000,
        "to": 3500
      }
    },
    "0xdAC17F958D2ee523a2206206994597C13D831ec7": {
      "interestRateStrategy": {
        "from": "0xdd1BAC6A713c5b0EC42bA39D0c5e4582975DE6D6",
        "to": "0x8F183Ee74C790CB558232a141099b316D6C8Ba6E"
      }
    }
  },
  "strategies": {
    "0x8F183Ee74C790CB558232a141099b316D6C8Ba6E": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "50000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "40000000000000000000000000",
        "stableRateSlope2": "720000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "750000000000000000000000000"
      }
    },
    "0xC82dF96432346cFb632473eB619Db3B8AC280234": {
      "from": null,
      "to": {
        "baseStableBorrowRate": "60000000000000000000000000",
        "baseVariableBorrowRate": 0,
        "maxExcessStableToTotalDebtRatio": "800000000000000000000000000",
        "maxExcessUsageRatio": "550000000000000000000000000",
        "optimalStableToTotalDebtRatio": "200000000000000000000000000",
        "optimalUsageRatio": "450000000000000000000000000",
        "stableRateSlope1": "70000000000000000000000000",
        "stableRateSlope2": "3000000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
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