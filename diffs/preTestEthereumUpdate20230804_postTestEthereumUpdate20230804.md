## Reserve changes

### Reserves altered

#### CRV ([0xD533a949740bb3306d119CC777fa900bA034cd52](https://etherscan.io/address/0xD533a949740bb3306d119CC777fa900bA034cd52))

| description | value before | value after |
| --- | --- | --- |
| debtCeiling | 20,900,000 $ | 5,000,000 $ |
| ltv | 55 % | 35 % |
| liquidationThreshold | 61 % | 41 % |


## Raw diff

```json
{
  "reserves": {
    "0xD533a949740bb3306d119CC777fa900bA034cd52": {
      "debtCeiling": {
        "from": 2090000000,
        "to": 500000000
      },
      "liquidationThreshold": {
        "from": 6100,
        "to": 4100
      },
      "ltv": {
        "from": 5500,
        "to": 3500
      }
    }
  }
}
```