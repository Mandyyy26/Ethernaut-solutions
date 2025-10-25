# Level 4 – Telephone

**Goal:** To claim the ownership of the contract.

**Vulnerability:**
`changeOwner()` function allows ownership takeover when `tx.origin != msg.sender`.

**Exploit Steps:**

1. write an attack contract which will call the `changeOwner()` function on your behalf, such that `tx.origin != msg.sender`.
2. Claim the ownership by call `changeOwner` function through the attack contract.

**Fix:**  
restrict the `changeOwner()` such that only the current owner can tranfer the ownership of the account.
