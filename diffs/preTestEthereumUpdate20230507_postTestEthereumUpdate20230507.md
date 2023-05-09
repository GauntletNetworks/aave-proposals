## Reserve changes

### Reserve altered

#### GUSD ([0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd](https://etherscan.io/address/0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x2893405d64a7Bc8Db02Fa617351a5399d59eCf8D](https://etherscan.io/address/0x2893405d64a7Bc8Db02Fa617351a5399d59eCf8D) | [0x78Fe5d0427E669ba9F964C3495fF381a805a0487](https://etherscan.io/address/0x78Fe5d0427E669ba9F964C3495fF381a805a0487) |
| optimalUsageRatio | 80 % | 70 % |
| maxExcessUsageRatio | 20 % | 30 % |
| variableRateSlope2 | 100 % | 150 % |
| interestRate | ![before](/.assets/c68564d8f84cae803b5ce093e3c16a2320d839a3.svg) | ![after](/.assets/7c014a7e5ae96694b0cffee4b2eddadf87478108.svg) |

#### WBTC ([0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599](https://etherscan.io/address/0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xf41E8F817e6C399d1AdE102059c454093b24f35B](https://etherscan.io/address/0xf41E8F817e6C399d1AdE102059c454093b24f35B) | [0x32f3A6134590fc2d9440663d35a2F0a6265F04c4](https://etherscan.io/address/0x32f3A6134590fc2d9440663d35a2F0a6265F04c4) |
| variableRateSlope1 | 8 % | 4 % |
| interestRate | ![before](/.assets/021926cd285ee1fba70b3acf461b0293ae08fb03.svg) | ![after](/.assets/9024b25803beaac85c9e1e00e50e08c212c3d6ee.svg) |

#### FRAX ([0x853d955aCEf822Db058eb8505911ED77F175b99e](https://etherscan.io/address/0x853d955aCEf822Db058eb8505911ED77F175b99e))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xb0a73aC3B10980A598685d4631c83f5348F5D32c](https://etherscan.io/address/0xb0a73aC3B10980A598685d4631c83f5348F5D32c) | [0x492dcEF1fc5253413fC5576B9522840a1A774DCe](https://etherscan.io/address/0x492dcEF1fc5253413fC5576B9522840a1A774DCe) |
| variableRateSlope2 | 75 % | 100 % |
| interestRate | ![before](/.assets/e6957fe4c310ba51f499314c131f0977304a09d1.svg) | ![after](/.assets/704f19cf0e34dff3f9cc310e94fefbf076d4b4ee.svg) |

#### USDP ([0x8E870D67F660D95d5be530380D0eC0bd388289E1](https://etherscan.io/address/0x8E870D67F660D95d5be530380D0eC0bd388289E1))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x404d396fc42e20d14585A1a10Cd64BDdC6C6574A](https://etherscan.io/address/0x404d396fc42e20d14585A1a10Cd64BDdC6C6574A) | [0xaC63290BC16fBc33353b14f139cEf1c660ba56F0](https://etherscan.io/address/0xaC63290BC16fBc33353b14f139cEf1c660ba56F0) |
| optimalUsageRatio | 90 % | 80 % |
| maxExcessUsageRatio | 10 % | 20 % |
| variableRateSlope2 | 60 % | 75 % |
| interestRate | ![before](/.assets/1571932d0fcbd41e429b19c18a080afc59cc51fe.svg) | ![after](/.assets/e6957fe4c310ba51f499314c131f0977304a09d1.svg) |

#### USDT ([0xdAC17F958D2ee523a2206206994597C13D831ec7](https://etherscan.io/address/0xdAC17F958D2ee523a2206206994597C13D831ec7))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x33DeAc0861FD6a9235b86172AA939E79085c6f52](https://etherscan.io/address/0x33DeAc0861FD6a9235b86172AA939E79085c6f52) | [0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8](https://etherscan.io/address/0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8) |
| variableRateSlope2 | 75 % | 100 % |
| stableRateSlope2 | 75 % | 100 % |
| interestRate | ![before](/.assets/c415a8c57745a62d63e11134fe8acf5059377542.svg) | ![after](/.assets/2e987a4911a41c316461bd57acf38be5b6ae837b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd": {
      "interestRateStrategy": {
        "from": "0x2893405d64a7Bc8Db02Fa617351a5399d59eCf8D",
        "to": "0x78Fe5d0427E669ba9F964C3495fF381a805a0487"
      }
    },
    "0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599": {
      "interestRateStrategy": {
        "from": "0xf41E8F817e6C399d1AdE102059c454093b24f35B",
        "to": "0x32f3A6134590fc2d9440663d35a2F0a6265F04c4"
      }
    },
    "0x853d955aCEf822Db058eb8505911ED77F175b99e": {
      "interestRateStrategy": {
        "from": "0xb0a73aC3B10980A598685d4631c83f5348F5D32c",
        "to": "0x492dcEF1fc5253413fC5576B9522840a1A774DCe"
      }
    },
    "0x8E870D67F660D95d5be530380D0eC0bd388289E1": {
      "interestRateStrategy": {
        "from": "0x404d396fc42e20d14585A1a10Cd64BDdC6C6574A",
        "to": "0xaC63290BC16fBc33353b14f139cEf1c660ba56F0"
      }
    },
    "0xdAC17F958D2ee523a2206206994597C13D831ec7": {
      "interestRateStrategy": {
        "from": "0x33DeAc0861FD6a9235b86172AA939E79085c6f52",
        "to": "0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8"
      }
    }
  },
  "strategies": {
    "0x32f3A6134590fc2d9440663d35a2F0a6265F04c4": {
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
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": 0,
        "stableRateSlope2": 0,
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "1000000000000000000000000000"
      }
    },
    "0x78Fe5d0427E669ba9F964C3495fF381a805a0487": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "300000000000000000000000000",
        "optimalUsageRatio": "700000000000000000000000000",
        "stableRateSlope1": "40000000000000000000000000",
        "stableRateSlope2": "1000000000000000000000000000",
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "1500000000000000000000000000"
      }
    },
    "0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8": {
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
    },
    "0xaC63290BC16fBc33353b14f139cEf1c660ba56F0": {
      "from": null,
      "to": {
        "baseVariableBorrowRate": 0,
        "maxExcessUsageRatio": "200000000000000000000000000",
        "optimalUsageRatio": "800000000000000000000000000",
        "stableRateSlope1": 0,
        "stableRateSlope2": 0,
        "variableRateSlope1": "40000000000000000000000000",
        "variableRateSlope2": "750000000000000000000000000"
      }
    }
  }
}
```