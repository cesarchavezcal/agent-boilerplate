# Implementation Plan & Architectural Critique: Testing Directives in `AGENTS.md`

Evaluation and architectural recommendations for the 3 proposed testing rules at the top of `AGENTS.md`.

---

## 1. Architectural Critique: "Why Yes" and "Why Not"

### Rule 1: *"NEVER write unit tests after you write code."*

#### WHY YES (The Discipline)
- **Eliminates Tautological Tests**: When an AI agent writes tests after code, it invariably writes tests that pass against its own bugs, confirming *what the code happens to do* rather than *what the business specification requires*.
- **Enforces Clean Seams**: Writing tests first forces the agent to design deep, modular, and testable interfaces instead of coupling everything to implementation details.

#### WHY NOT (The Risk & Rigid Trap)
- **Bug Repos & Regressions**: When diagnosing an existing bug in production, you must first write a reproduction test against existing code to prove the failure before touching the fix.
- **Legacy & Spike Code**: For exploratory spikes or existing codebases without tests, strict prohibition without nuance causes agents to either skip writing tests altogether or hallucinate reasons to bypass the rule.
- **Better Phrasing**: *"Write tests BEFORE code (Red ➔ Green ➔ Refactor). Tests written after implementation are tautological and rejected."*

---

### Rule 2: *"Highly prefer E2E tests as the sole testing mechanism. Use them to verify complex features work. At the end of E2E tests, produce a verifiable and repeatable artifact."*

#### WHY YES (The Value & Artifacts)
- **Zero Mock Delusions**: Mocks often lie; E2E tests exercise the real seams, database, network, and browser rendering.
- **Repeatable Artifacts**: Demanding verifiable artifacts (Playwright traces, videos, screenshots, or JUnit test output) gives the harness concrete, deterministic proof of completion.

#### WHY NOT (THE CRITICAL ARCHITECTURAL FLAW — THE "ICE CREAM CONE" ANTI-PATTERN)
- **Flakiness & Combinatorial Explosion**: Testing every validation rule, edge case, date calculation, integer cents conversion, and auth state through a full E2E browser runner causes massive test suites that are slow, brittle, and prone to race conditions.
- **Feedback Loop Latency Destroys AI Velocity**: The agent harness relies on a fast-failing `./init.sh` barrier (`set -e`). If every verification turn requires launching a browser, seeding databases, and running 50 E2E flows, each iteration takes 5–15 minutes instead of 3–5 seconds. Context tokens and timeouts will skyrocket.
- **Root Cause Obfuscation**: When an E2E test fails, it says "Checkout button didn't enable", but gives zero insight into whether it was a rounding error, a failed regex, or a network timeout.
- **Architectural Solution (Testing Trophy)**:
  - **E2E / Integration Tests**: Guard the critical user journeys and cross-system flows (producing traces/artifacts).
  - **Unit / Contract Tests**: Guard business rules, state machines, math, and domain invariants with sub-second feedback.

---

### Rule 3: *"If you must test a system in isolation, FIRST write all the ways it could fail, THEN write the code."*

#### WHY YES (Failure-Mode-First Thinking)
- **Directly Aligns with FMEA (Failure Mode and Effects Analysis)**: 80% of production code is error handling, timeouts, edge cases, and boundary protection.
- **Synergizes with `/product-description` & `/spec-to-tests`**: Forces the agent to populate negative invariants (`SCEN-XXX` error scenarios, 5 interrupt families) before writing happy-path code.

#### WHY NOT (The Implicit Anti-Unit Bias)
- **Phrasing treats isolation as a "last resort"**: *"If you must test a system in isolation..."* implies isolated testing is an undesirable compromise. In clean/hexagonal architecture, isolating domain logic from databases and UI frameworks is a mark of superior design, not a failure.
- **Better Phrasing**: *"Before implementing any component, FIRST enumerate all failure modes, negative invariants, and boundary conditions as failing test cases, THEN implement the solution."*

---

## 2. Proposed Refined Rules for Top of `AGENTS.md`

Instead of rigid extremes that slow the agent to a crawl, we propose these high-impact directives for Section 0 / 1 of `AGENTS.md`:

```markdown
## Testing Directives & Verification Invariants

1. **Test-First Invariant (Anti-Tautology)**: NEVER write tests after implementing code. All tests must be born from specification contracts (`spec-tests.md`) before code is written (Red ➔ Green ➔ Refactor).
2. **Failure-First Enumeration**: Before writing any implementation code, FIRST enumerate every way the system can fail (boundary conditions, rate limits, invalid state, network drop, timeout), write failing assertions for them, and THEN implement resilience.
3. **Behavioral Seam Verification**: 
   - Use fast, isolated domain tests for business rules, state machines, and calculations.
   - Use end-to-end (E2E) integration tests for critical user journeys and complex multi-service workflows.
   - Every E2E test suite MUST produce a verifiable, repeatable artifact (execution trace, screenshot report, or structured JSON summary) recorded in `progress.md`.
```

---

## 3. Verification Plan

- Validate harness score remains 100/100 (`node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .`).
- Verify `./init.sh` remains fast and green.
