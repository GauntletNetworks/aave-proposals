## Reserve changes

### Reserve altered

#### WMATIC ([0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270](https://polygonscan.com/address/0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x553b64567dE5392f6B189F6AC89581342DaD12F9](https://polygonscan.com/address/0x553b64567dE5392f6B189F6AC89581342DaD12F9) | [0x78Fe5d0427E669ba9F964C3495fF381a805a0487](https://polygonscan.com/address/0x78Fe5d0427E669ba9F964C3495fF381a805a0487) |
| optimalUsageRatio | 45 % | 65 % |
| maxExcessUsageRatio | 55 % | 35 % |
| variableRateSlope1 | 7 % | 6 % |
| interestRate | ![before](/.assets/e262e1b504a43df3e7f0143d88cb5d324bd3c344.svg) | ![after](/.assets/d623b05c15166363301aacb46d7c2c761da0487f.svg) |

#### WBTC ([0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6](https://polygonscan.com/address/0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xD10e8A63EC6CfC6FE74B369d29D2765944d23505](https://polygonscan.com/address/0xD10e8A63EC6CfC6FE74B369d29D2765944d23505) | [0x142DCAEC322aAA25141B2597bf348487aDBd596d](https://polygonscan.com/address/0x142DCAEC322aAA25141B2597bf348487aDBd596d) |
| variableRateSlope1 | 8 % | 4 % |
| interestRate | ![before](/.assets/021926cd285ee1fba70b3acf461b0293ae08fb03.svg) | ![after](/.assets/9024b25803beaac85c9e1e00e50e08c212c3d6ee.svg) |

#### WETH ([0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619](https://polygonscan.com/address/0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xcDAC94de1cf4e8E25B6C61Df6481C344c5E88f44](https://polygonscan.com/address/0xcDAC94de1cf4e8E25B6C61Df6481C344c5E88f44) | [0x492dcEF1fc5253413fC5576B9522840a1A774DCe](https://polygonscan.com/address/0x492dcEF1fc5253413fC5576B9522840a1A774DCe) |
| variableRateSlope1 | 8 % | 4 % |
| interestRate | ![before](/.assets/9ec14174f670884ad26c4e60158597a3ea46106e.svg) | ![after](/.assets/109889a4fe0e3bcfce871de154c889a0ff8e0e94.svg) |

#### USDT ([0xc2132D05D31c914a87C6611C10748AEb04B58e8F](https://polygonscan.com/address/0xc2132D05D31c914a87C6611C10748AEb04B58e8F))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xe7a516f340a3f794a3B2fd0f74A7242b326b9f33](https://polygonscan.com/address/0xe7a516f340a3f794a3B2fd0f74A7242b326b9f33) | [0xF4d1352b3E9E99FCa6Aa20F62Fe95192A26C9527](https://polygonscan.com/address/0xF4d1352b3E9E99FCa6Aa20F62Fe95192A26C9527) |
| optimalUsageRatio | 90 % | 80 % |
| maxExcessUsageRatio | 10 % | 20 % |
| variableRateSlope2 | 60 % | 100 % |
| stableRateSlope2 | 60 % | 100 % |
| interestRate | ![before](/.assets/1ee1814a06c37c32f0efd02a4fda97a8278b0714.svg) | ![after](/.assets/2e987a4911a41c316461bd57acf38be5b6ae837b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270": {
      "interestRateStrategy": {
        "from": "0x553b64567dE5392f6B189F6AC89581342DaD12F9",
        "to": "0x78Fe5d0427E669ba9F964C3495fF381a805a0487"
      }
    },
    "0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6": {
      "interestRateStrategy": {
        "from": "0xD10e8A63EC6CfC6FE74B369d29D2765944d23505",
        "to": "0x142DCAEC322aAA25141B2597bf348487aDBd596d"
      }
    },
    "0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619": {
      "interestRateStrategy": {
        "from": "0xcDAC94de1cf4e8E25B6C61Df6481C344c5E88f44",
        "to": "0x492dcEF1fc5253413fC5576B9522840a1A774DCe"
      }
    },
    "0xc2132D05D31c914a87C6611C10748AEb04B58e8F": {
      "interestRateStrategy": {
        "from": "0xe7a516f340a3f794a3B2fd0f74A7242b326b9f33",
        "to": "0xF4d1352b3E9E99FCa6Aa20F62Fe95192A26C9527"
      }
    }
  },
  "strategies": {
    "0x142DCAEC322aAA25141B2597bf348487aDBd596d": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "350000000000000000000000000",
        "optimalUsageRatio": "650000000000000000000000000",
        "stableRateSlope1": "100000000000000000000000000",
        "stableRateSlope2": "3000000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    },
    "0x492dcEF1fc5253413fC5576B9522840a1A774DCe": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "350000000000000000000000000",
        "optimalUsageRatio": "650000000000000000000000000",
        "stableRateSlope1": "100000000000000000000000000",
        "stableRateSlope2": "1000000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "1000000000000000000000000000"
      }
    },
    "0x78Fe5d0427E669ba9F964C3495fF381a805a0487": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "350000000000000000000000000",
        "optimalUsageRatio": "650000000000000000000000000",
        "stableRateSlope1": "100000000000000000000000000",
        "stableRateSlope2": "3000000000000000000000000000",
        "variableRateSlope1": "60000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    },
    "0xF4d1352b3E9E99FCa6Aa20F62Fe95192A26C9527": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": "20000000000000000000000000",
        "stableRateSlope2": "1000000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "1000000000000000000000000000"
      }
    }
  }
}
```