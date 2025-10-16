# Level 1 – Fallback

**Goal:** Become the owner and withdraw funds.

**Vulnerability:**
`receive()` function allows ownership takeover when `msg.value > 0`.

**Exploit Steps:**

1. Call `contribute()` with small ETH.
2. Call `receive()` by sending ETH directly.
3. Call `withdraw()` as owner.

**Fix:**  
Restrict `receive()` to the current owner only.
