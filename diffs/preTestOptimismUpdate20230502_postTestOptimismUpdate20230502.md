## Reserve changes

### Reserve altered

#### sUSD ([0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9](https://optimistic.etherscan.io/address/0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9))

| description | value before | value after |
| --- | --- | --- |
| eModeCategory | 1 | 0 |


#### USDT ([0x94b008aA00579c1307B0EF2c499aD98a8ce58e58](https://optimistic.etherscan.io/address/0x94b008aA00579c1307B0EF2c499aD98a8ce58e58))

| description | value before | value after |
| --- | --- | --- |
| eModeCategory | 1 | 0 |


## Raw diff

```json
{
  "eModes": {
    "1": {
      "liquidationThreshold": {
        "from": 9750,
        "to": 9500
      },
      "ltv": {
        "from": 9700,
        "to": 9300
      }
    }
  },
  "reserves": {
    "0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9": {
      "eModeCategory": {
        "from": 1,
        "to": 0
      }
    },
    "0x94b008aA00579c1307B0EF2c499aD98a8ce58e58": {
      "eModeCategory": {
        "from": 1,
        "to": 0
      }
    }
  }
}
```