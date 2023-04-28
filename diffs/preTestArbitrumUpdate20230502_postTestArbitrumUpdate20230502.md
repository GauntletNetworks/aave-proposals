## Reserve changes

### Reserve altered

#### EURS ([0xD22a58f79e9481D1a88e00c343885A588b34b68B](https://https://arbiscan.io/address/0xD22a58f79e9481D1a88e00c343885A588b34b68B))

| description | value before | value after |
| --- | --- | --- |
| eModeCategory | 1 | 0 |


#### USDT ([0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9](https://https://arbiscan.io/address/0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9))

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
    "0xD22a58f79e9481D1a88e00c343885A588b34b68B": {
      "eModeCategory": {
        "from": 1,
        "to": 0
      }
    },
    "0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9": {
      "eModeCategory": {
        "from": 1,
        "to": 0
      }
    }
  }
}
```