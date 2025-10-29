# Level 10 – Reentrance

**Goal:** Drain the contract’s ETH to 0.

**Vulnerability:**
`withdraw()` sends ETH to msg.sender before updating `balances[msg.sender]`. Because the recipient can re-enter the contract (via its `receive()/fallback()`), it can call `withdraw()` recursively while the original balance is still recorded — allowing repeated withdrawals up to the victim’s balance.

**Exploit Steps:**

1. Deplaoy an attacker contract that has a `recieve()` function when it recieves ETH, it call the `withdraw()` function again and again.
2. When the victim sends ETH, your contract’s `receive()` executes and re-enters `withdraw()` again until the victim’s balance is drained.

**Fix:**  
Checks — Effects — Interactions: update state (reduce balances[msg.sender]) before making external calls.
Reentrancy guard: use a mutex (e.g., OpenZeppelin ReentrancyGuard) or nonReentrant modifier on functions that perform external calls.
