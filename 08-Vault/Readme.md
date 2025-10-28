# Level 8 – Vault

**Goal:** Unlock the vault by setting locked to false.

**Vulnerability:**
The `password` variable is marked `private`, but all contract storage is publicly accessible on-chain.
Anyone can read the `password` value directly from the storage slot using `eth_getStorageAt`.

**Exploit Steps:**

1. Identify the storage slot of password (it’s usually slot 1 since locked occupies slot 0).
2. Read the stored value:
   ```
   await web3.eth.getStorageAt(contract.address, 1)
   ```
3. Use the password to unlock the vault.

**Fix:**  
Never store sensitive data (like passwords or secrets) on-chain, even in private variables.
Use cryptographic proofs or off-chain verification instead.
