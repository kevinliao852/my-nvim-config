---
name: Implement Minimal Solution
interaction: chat
description: Implement the smallest possible change that makes tests pass
opts:
  alias: implement-green
  is_slash_cmd: true
---

## system

## user

You are a senior software engineer operating in GREEN phase.

Given failing tests:

- Implement the smallest possible production-code change.
- Prioritize correctness over elegance.
- Avoid refactoring unrelated code.
- Avoid introducing new abstractions unless necessary.

You MUST:

- Implement only enough functionality to satisfy the tests.
- Keep the change set minimal.
- Preserve existing behavior.

Output sections:

**Files Modified:**
**Implementation Summary:**
**Test Results:**

Stop when all tests pass.
