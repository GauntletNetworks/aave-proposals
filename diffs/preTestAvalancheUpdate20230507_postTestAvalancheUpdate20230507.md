## Reserve changes

### Reserve altered

#### WETH.e ([0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB](https://snowtrace.io/address/0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647](https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647) | [0x32f3A6134590fc2d9440663d35a2F0a6265F04c4](https://snowtrace.io/address/0x32f3A6134590fc2d9440663d35a2F0a6265F04c4) |
| optimalUsageRatio | 45 % | 65 % |
| maxExcessUsageRatio | 55 % | 35 % |
| variableRateSlope1 | 7 % | 4 % |
| variableRateSlope2 | 300 % | 100 % |
| interestRate | ![before](/.assets/cb915942068dba199ca11ffeb52b7307ca371150.svg) | ![after](/.assets/7b04b1437ef939fed53fe687b08ae0f741ca419d.svg) |

#### WAVAX ([0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7](https://snowtrace.io/address/0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647](https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647) | [0xaC63290BC16fBc33353b14f139cEf1c660ba56F0](https://snowtrace.io/address/0xaC63290BC16fBc33353b14f139cEf1c660ba56F0) |
| optimalUsageRatio | 45 % | 65 % |
| maxExcessUsageRatio | 55 % | 35 % |
| variableRateSlope1 | 7 % | 6 % |
| interestRate | ![before](/.assets/cb915942068dba199ca11ffeb52b7307ca371150.svg) | ![after](/.assets/1a186439b9ce141d73e8dfae0de05f870004cb3b.svg) |

#### USDT.e ([0xc7198437980c041c805A1EDcbA50c1Ce5db95118](https://snowtrace.io/address/0xc7198437980c041c805A1EDcbA50c1Ce5db95118))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xD96B68638bdbb625A49F5BAC0dC3B66764569d30](https://snowtrace.io/address/0xD96B68638bdbb625A49F5BAC0dC3B66764569d30) | [0x78Fe5d0427E669ba9F964C3495fF381a805a0487](https://snowtrace.io/address/0x78Fe5d0427E669ba9F964C3495fF381a805a0487) |
| variableRateSlope2 | 75 % | 100 % |
| stableRateSlope2 | 75 % | 100 % |
| interestRate | ![before](/.assets/c415a8c57745a62d63e11134fe8acf5059377542.svg) | ![after](/.assets/2e987a4911a41c316461bd57acf38be5b6ae837b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB": {
      "interestRateStrategy": {
        "from": "0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647",
        "to": "0x32f3A6134590fc2d9440663d35a2F0a6265F04c4"
      }
    },
    "0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7": {
      "interestRateStrategy": {
        "from": "0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647",
        "to": "0xaC63290BC16fBc33353b14f139cEf1c660ba56F0"
      }
    },
    "0xc7198437980c041c805A1EDcbA50c1Ce5db95118": {
      "interestRateStrategy": {
        "from": "0xD96B68638bdbb625A49F5BAC0dC3B66764569d30",
        "to": "0x78Fe5d0427E669ba9F964C3495fF381a805a0487"
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
        "maxExcessUsageRatio": "350000000000000000000000000",
        "optimalUsageRatio": "650000000000000000000000000",
        "stableRateSlope1": 0,
        "stableRateSlope2": 0,
        "variableRateSlope1": "60000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    }
  }
}
```