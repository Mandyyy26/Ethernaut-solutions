# Level 6 – Delegation

**Goal:** To claim the ownership of the contract.

**Vulnerability:**
The `fallback()` in the delegation (proxy) contract forwards calldata to a separate delegate (logic) contract using delegatecall. Because delegatecall executes the delegate’s code in the proxy’s storage context, calling the delegate’s `pwn()` function via the proxy will update the proxy’s owner storage slot to msg.sender.

**Exploit Steps:**

1. Use the ABI of the delegate contract to encode the pwn() call (selector + args).

2. Send that encoded calldata to the proxy’s address (for example by using Remix “At Address” with the delegate ABI).

3. The proxy’s fallback() performs delegatecall(msg.data) → delegate’s pwn() runs, writing to the proxy’s storage and setting owner = msg.sender.

4. Attacker becomes owner.

**Fix:**

1. Access control: Protect pwn() (or any function that writes ownership) with a strict modifier (e.g., onlyOwner or onlyAdmin).

2. Avoid exposing dangerous functions in logic: Make functions that mutate ownership internal or remove them entirely from logic meant to be delegate-called by untrusted callers.

3. Careful upgradeability design: If using proxies, maintain strict storage layout and use battle-tested patterns like OpenZeppelin’s TransparentUpgradeableProxy or UUPS.
