# Level 9 – King

**Goal:** Become the king (become the contract's king) and lock the throne so no one else can replace you.

**Vulnerability:**
The contract sends ETH to the current king` (payable(king).transfer(msg.value))` before updating king. If the current king is a contract that reverts on receiving ETH, that external transfer will fail and block any future calls to` receive()`, preventing the `king` variable from being updated.

**Exploit Steps:**

1. Deploy an attacker contract whose receive() or fallback() reverts (explicitly refusing ETH). Or it the contract does not have receive() or fallback().

2. From an EOA, call the attacker contract and have it call the King contract’s fallback/receive, sending msg.value >= prize. This makes the attacker contract the king.

3. Because the attacker contract reverts on incoming ETH, any subsequent attempt by others to become king will fail when the King contract tries payable(king).transfer(...) to the attacker — the transfer reverts and the king is never updated.

Verify by calling King.\_king() — it should be the attacker contract address, and future attempts to claim the throne will revert.

**Fix:**  
Avoid doing external calls to an untrusted address while still in an inconsistent state. Two safe approaches:

1. Checks-effects-interactions: update king and prize first, then attempt the external transfer (so a failing transfer doesn’t leave state inconsistent).

2. Pull payments: instead of pushing ETH to the previous king inside receive(), record an owed balance for the previous king and let them withdraw later (use withdraw()/pull pattern).
