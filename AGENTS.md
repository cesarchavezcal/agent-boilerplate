# Global Agent Instructions (`AGENTS.md`)

This file defines the primary operational rules, pipeline lifecycle, and communication standards for all AI agents working in this repository.

---

## 0. Session-Start Onboarding Auto-Trigger

Whenever an agent session starts:
1. **Inspect Context**: Check [`CONTEXT.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/CONTEXT.md) for placeholder strings (`[Your Project Name]`).
2. **Auto-Prompt**: If placeholders are present, inform the user that the repository is uninitialized and offer to execute the **`/init-project`** onboarding workflow.

---

## 1. Primary Operational Mode: `/i-have-adhd`

This repository operates under **ADHD communication guidelines by default**:

1. **Lead with the Next Action**: The first line of your response must be an immediate, actionable step (command, file edit path, or specific answer). No long prose introductions.
2. **Number Multi-Step Work**: Format step-by-step tasks as numbered lists (1..N) where each step is a single bounded action.
3. **Suppress Tangents**: Focus strictly on the task at hand. Do not drag unnecessary context or hypothetical options into view.
4. **Make Progress Visible**: Highlight completed milestones clearly (`✅ Task Complete`).
5. **Concrete End Action**: End every turn with ONE concrete, small next action (< 2 minutes).

---

## 2. Unified SDD & 7-Step Architecture Pipeline

This repository unifies the specialized 7-step design skills with the official **Spec-Driven Development (SDD)** lifecycle. Canonical SDD phase commands and specialized pipeline skills are fully interoperable.

### Unified Pipeline Mapping Matrix

```text
┌───────────────────────────────┬───────────────────────────────┬───────────────────────────────────────────┐
│ SDD Canonical Phase           │ Specialized Skill Triggers    │ Artifact Target Paths                     │
├───────────────────────────────┼───────────────────────────────┼───────────────────────────────────────────┤
│ 1. /sdd-explore, /sdd-propose │ /product-function, /grill     │ docs/product-design/product_function.md   │
│                               │                               │ openspec/changes/<change>/proposal.md     │
│ 2. /sdd-spec                  │ /to-spec                      │ openspec/specs/<feature>/spec.md          │
│ 3. /sdd-design                │ /ia, /ooux, /codebase-design  │ docs/product-design/ia.md, ooux.md        │
│                               │                               │ openspec/changes/<change>/design.md       │
│ 4. /sdd-tasks                 │ /to-tickets                   │ openspec/changes/<change>/tasks.md        │
│ 5. /sdd-apply                 │ /implement, /harness, /team   │ Working source code + unit/integration    │
│ 6. /sdd-verify                │ /code-review, .gga review     │ Review receipts + pre-commit audit        │
│ 7. /sdd-archive               │ PR merge + /sdd-archive       │ openspec/changes/archive/<date>-<change>/ │
└───────────────────────────────┴───────────────────────────────┴───────────────────────────────────────────┘
```

### Execution Routing Policy for `/sdd-apply` / `/implement`
When executing implementation tasks:
1. **Default Route (Sequential / Single Ticket)**: `/sdd-apply` triggers `/implement`, which delegates to an isolated **`/harness`** subagent for strict Red ➔ Green ➔ Refactor TDD.
2. **Parallel Swarm Route (Multi-Module / `--team`)**: For large or decoupled modules across boundaries, `/sdd-apply --team` dispatches **`/team-cheap`**, fanning out parallel `/harness` subagents.

### Quality & Verification Gate for `/sdd-verify` / `/code-review`
1. **Two-Axis Audit (`/code-review`)**: Runs parallel subagents verifying (1) Spec Compliance and (2) Standards Compliance.
2. **AI Pre-Commit Guardrail ([`.gga`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.gga))**: Blocks non-compliant commits against Section 6 coding rules using the configured provider in `.gga`.

---

## 3. Mandatory `/plan` Boundary Rule

Whenever the user invokes `/plan`:
1. **Plan Artifact Creation**: Create the implementation plan artifact (`request_feedback = true`).
2. **Mandatory Turn Boundary Pause**: STOP calling tools immediately after writing the artifact.
3. **Explicit Approval Gate**: DO NOT run modifying code edits or git commands until the user explicitly responds with approval.

---

## 4. Documentation & Storage Conventions

- **Product Design & Schemas**: Saved in `docs/product-design/` (`product_function.md`, `ia.md`, `ooux.md`).
- **OpenSpec Specifications**: Living baseline specs in `openspec/specs/`, active changes in `openspec/changes/`, and archived records in `openspec/changes/archive/`.
- **Implementation Plans & Walkthroughs**: Saved in `docs/planning/`. Prepend completed plan filenames with `✅_` (e.g. `docs/planning/✅_my_plan.md`).


---

## 5. Mandatory Git Workflow Lifecycle, Branch Naming & PR Conventions

### Git Workflow Lifecycle
All work MUST follow this 4-step sequence without exception:
```text
Create Branch ──> Make Changes & Commit ──> Push & Open PR ──> Merge into Base Branch
```

### Branch Naming Conventions
- **Initial Setup (`/init-project`)**: `chore/CCH/initial-setup-{summary}`
- **Standard Feature / Bug Work**: `{prefix}/CCH/{project-initials}-{ticket-number}-{ticket-summary}`

Where `{prefix}` is derived from issue/task type:
- **Bug** → `bugfix`
- **Story / Feature / Epic** → `feature`
- **Maintenance / Improvement** → `chore`

*If no ticket ID is in the prompt, defer branch creation until the ticket is fetched.*

### Commit Message Convention (Conventional Commits)
Format: `<prefix>(<scope>): <short summary>`
Examples:
- `feat(auth): add login form validation`
- `fix(api): handle timeout retry`
- `chore(setup): configure initial project onboarding and git rules`

### PR Instructions & Writing Principles
When writing or creating a Pull Request:
- **Describe WHAT, not HOW**: Explain what the PR delivers to reviewers, not line-by-line implementation details.
- **Keep it High-Level & Scannable**: 2–4 sentences is standard. Use bullet points only for distinct deliverables.
- **Surprise / Risk Callouts Only**: Only surface specific code details or file paths if complex logic, edge cases, security considerations, or architectural changes require careful review.
- **PR Labels**: Check `.github/workflows/` or `.github/*.yml` for required preview app PR labels. Always attach matching PR labels automatically when opening PRs (e.g. `gh pr create --label "chore"` or `--label "feature"`).

---

## 6. Core Coding Standards & Architectural Guidelines (GGA Review Rules)

These standards are strictly enforced by automated GGA code reviews and agent pairing workflows:

### Architectural Principles
1. **Clean / Modular Architecture**: Separate business logic (domain), orchestrators (application/use cases), and adapters (UI, DB, external APIs).
2. **Deep Modules & Clear Interfaces**: Keep module interfaces simple and signatures expressive while hiding complex implementation details inside.
3. **Container-Presentational Separation**: In UI layers, isolate side effects, state fetching, and data subscriptions from pure visual rendering components.

### Type Safety & Language Strictness
1. **Strict Types**: No untyped `any` or loose type overrides. Use exact interfaces and discriminated unions for polymorphic data structures.
2. **Safe Assertions**: Avoid blind `as` casting. Use runtime validators, type guards, or `@total-typescript/shoehorn` in test environments.
3. **Explicit Return Types & Exports**: All public-facing functions and exported modules must have clear type signatures.

### Error Handling & Resilience
1. **Explicit Error Paths**: Favor structured Result/Either types or domain-specific typed errors over silent failures or raw generic `throw Error()`.
2. **No Swallowed Exceptions**: Every `catch` block must either handle, enrich, or rethrow the error with meaningful contextual diagnostics.

### Testing & Verification (TDD First)
1. **Test-First Discipline**: Write failing unit or integration tests before implementing feature logic (Red -> Green -> Refactor).
2. **Deterministic Tests**: Mock network and non-deterministic state at clear boundaries; avoid flaky sleep timers or arbitrary timeouts.

### Code Hygiene & Style
1. **Self-Documenting Code**: Choose descriptive domain terminology over cryptic abbreviations.
2. **Dead Code Elimination**: Remove unused imports, dead branches, and obsolete comments before committing.
3. **Conventional Commits**: Ensure all changes conform to conventional commit format.


