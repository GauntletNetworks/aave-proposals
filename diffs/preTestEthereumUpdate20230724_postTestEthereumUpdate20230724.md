## Reserve changes

### Reserve altered

#### DAI ([0x6B175474E89094C44Da98b954EedeAC495271d0F](https://etherscan.io/address/0x6B175474E89094C44Da98b954EedeAC495271d0F))

| description | value before | value after |
| --- | --- | --- |
| ltv | 67 % | 77 % |


#### wstETH ([0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0](https://etherscan.io/address/0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0))

| description | value before | value after |
| --- | --- | --- |
| liquidationBonus | 7 % | 6 % |


#### USDC ([0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48](https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48))

| description | value before | value after |
| --- | --- | --- |
| liquidationThreshold | 79 % | 80 % |


## Raw diff

```json
{
  "reserves": {
    "0x6B175474E89094C44Da98b954EedeAC495271d0F": {
      "ltv": {
        "from": 6700,
        "to": 7700
      }
    },
    "0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0": {
      "liquidationBonus": {
        "from": 10700,
        "to": 10600
      }
    },
    "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48": {
      "liquidationThreshold": {
        "from": 7900,
        "to": 8000
      }
    }
  }
}
```