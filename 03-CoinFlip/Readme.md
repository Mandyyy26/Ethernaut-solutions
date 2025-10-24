# Level 3 – CoinFlip

**Goal:** Guess the correct outcome of the coin flip 10 times in a row.

**Vulnerability:**
The result of coin flip is dependent on blockhash and a constant factor, which anyone can maniupate.

**Exploit Steps:**

1. Call `calculatee()` 10 times.
2. between every calculatee function call make sure that the subsequent transaction are not in the same block, therefore run this command in js console after every calculatee call.

```
await web3.currentProvider.send({ jsonrpc: "2.0", method: "evm_mine", params: [], id: 1 })
```

**Fix:**  
Choose more reliable random number generator(eg: chainlink vrf or Pyth random number generator) so that its difficult to predict the outcome.
