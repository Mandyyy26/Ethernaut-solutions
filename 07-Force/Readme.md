# Level 7 – Force

**Goal:** Make the contract balance greater than 0.

**Vulnerability:**
The `Force` contract has no `receive() `or `fallback()` function, meaning it cannot accept Ether through normal transactions. However, Ether can still be forcibly sent to it using low-level mechanisms such as `selfdestruct().`

**Exploit Steps:**

1. Deploy a malicious contract with some Ether.
2. In that contract, implement a `selfdestruct()` function that targets the `Force` contract’s address.
3. Call the function to destroy the contract and force-send its Ether to the `Force` contract.
4. Verify that the `Force` contract’s balance is now greater than 0.

**Fix:**  
Restrict `receive()` to the current owner only.
