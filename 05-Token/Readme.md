# Level 5 – Token

**Goal:** Increase your token balance more than you have. Preferrably a large number of tokens.

**Vulnerability:**
unsigned integer overflow.
during balance update `balances[msg.sender] -= _value;`, balance can fall below zero if we tranfer more than 20 tokens, which will result in integer overflow.

**Exploit Steps:**

1. Call `transfer()` function with `_value > 20`.

**Fix:**  
use openZepplines safeMath library to update balances, which will revert the transaction if any overflow will happen.
