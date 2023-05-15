## Reserve changes

### Reserve altered

#### WBTC.e ([0x50b7545627a5162F82A992c33b87aDc75187B218](https://snowtrace.io/address/0x50b7545627a5162F82A992c33b87aDc75187B218))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x79a906e8c998d2fb5C5D66d23c4c5416Fe0168D6](https://snowtrace.io/address/0x79a906e8c998d2fb5C5D66d23c4c5416Fe0168D6) | [0x354E84ec43aCD91e1C0135c3e691960E881DB4b7](https://snowtrace.io/address/0x354E84ec43aCD91e1C0135c3e691960E881DB4b7) |
| variableRateSlope1 | 7 % | 4 % |
| baseStableBorrowRate | 9 % | 6 % |
| interestRate | ![before](/.assets/19b2f23d55d76d891e7d30c29aa97741efed9d17.svg) | ![after](/.assets/2c7dedb9c0cda4f69d46743b5137df8d3fa9ce57.svg) |

#### USDC ([0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E](https://snowtrace.io/address/0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xf4a0039F2d4a2EaD5216AbB6Ae4C4C3AA2dB9b82](https://snowtrace.io/address/0xf4a0039F2d4a2EaD5216AbB6Ae4C4C3AA2dB9b82) | [0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398](https://snowtrace.io/address/0xD624AFA34614B4fe7FEe7e1751a2E5E04fb47398) |
| variableRateSlope1 | 4 % | 3.5 % |
| baseStableBorrowRate | 5 % | 4.5 % |
| interestRate | ![before](/.assets/ea60696e57315a00b0941d7fe1bd186df779165e.svg) | ![after](/.assets/0372907d0b2f3da48f7adcaed3b1452230cd5c2b.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x50b7545627a5162F82A992c33b87aDc75187B218": {
      "interestRateStrategy": {
        "from": "0x79a906e8c998d2fb5C5D66d23c4c5416Fe0168D6",
        "to": "0x354E84ec43aCD91e1C0135c3e691960E881DB4b7"
      }
    },
    "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E": {
      "interestRateStrategy": {
        "from": "0xf4a0039F2d4a2EaD5216AbB6Ae4C4C3AA2dB9b82",
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