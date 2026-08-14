# Skill Registry

> Auto-generated skill registry mapping all available agent skills in this workspace.
> Last updated: 2026-08-14

---

## Registry Overview

| Metric | Value |
|---|---|
| **Total Skills Registered** | 41 |
| **Primary Sources** | `mattpocock/skills` (35), `cesarchavezcal/personal-skills` (6) |
| **Storage Location** | `.agents/skills/` |
| **Lockfile** | [`skills-lock.json`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/skills-lock.json) |

---

## 1. Product Discovery & Specification

| Skill | Trigger / Command | Source | Description |
|---|---|---|---|
| [`product-function`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/product-function/SKILL.md) | `/product-function` | `cesarchavezcal/personal-skills` | Evaluates and scopes product features by modeling them as functions ($y = f(x)$) based on Ryan Singer's methodology. |
| [`grill-with-docs`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/grill-with-docs/SKILL.md) | `/grill-with-docs` | `mattpocock/skills` | Sharpens ideas by interview against existing repo docs, recording findings into `CONTEXT.md` and ADRs. |
| [`grill-me`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/grill-me/SKILL.md) | `/grill-me` | `mattpocock/skills` | Stateless interview primitive for sharpening concepts when working outside a repo. |
| [`grilling`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/grilling/SKILL.md) | `/grilling` | `mattpocock/skills` | Raw interview primitive underlying grill workflows (rounds, frontiers, decision-separation). |
| [`information-architecture-review`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/information-architecture-review/SKILL.md) | `/information-architecture` | `cesarchavezcal/personal-skills` | Designs, audits, and validates IA: sitemaps, navigation hierarchies, user flows, taxonomy. |
| [`ooux`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/ooux/SKILL.md) | `/ooux` | `cesarchavezcal/personal-skills` | Designs Object-Oriented UX: objects, core content vs metadata, nested relationships, and forced ranking matrices. |
| [`to-spec`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/to-spec/SKILL.md) | `/to-spec` | `mattpocock/skills` | Synthesizes current conversation into a comprehensive spec published to project tracker. |
| [`to-tickets`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/to-tickets/SKILL.md) | `/to-tickets` | `mattpocock/skills` | Decomposes spec into tracer-bullet tickets with explicit blocking edges. |
| [`wayfinder`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/wayfinder/SKILL.md) | `/wayfinder` | `mattpocock/skills` | Plans large, complex initiatives across multiple sessions via a decision map on tracker. |
| [`domain-modeling`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/domain-modeling/SKILL.md) | `/domain-modeling` | `mattpocock/skills` | Clarifies domain language, eliminates overloaded terms, and records ADRs. |
| [`codebase-design`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/codebase-design/SKILL.md) | `/codebase-design` | `mattpocock/skills` | Deep-module vocabulary and architecture design (depth, seams, interfaces, leverage). |

---

## 2. Engineering, TDD & Execution

| Skill | Trigger / Command | Source | Description |
|---|---|---|---|
| [`implement`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/implement/SKILL.md) | `/implement` | `mattpocock/skills` | Implements tickets test-first via internal TDD loops, closing out with code-review. |
| [`tdd`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/tdd/SKILL.md) | `/tdd` | `mattpocock/skills` | Test-driven development loop: Red-Green-Refactor with behavior-first focus. |
| [`harness`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/harness/SKILL.md) | `/harness` | `cesarchavezcal/personal-skills` | Standard execution harness for running autonomous tasks safely and deterministically. |
| [`team-cheap`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/team-cheap/SKILL.md) | `/team-cheap` | `cesarchavezcal/personal-skills` | Cost-optimized workspace-isolated subagent fan-out orchestration over `/harness`. |
| [`diagnosing-bugs`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/diagnosing-bugs/SKILL.md) | `/diagnosing-bugs` | `mattpocock/skills` | Root cause debugging with tight reproducible feedback loops and regression tests. |
| [`code-review`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/code-review/SKILL.md) | `/code-review` | `mattpocock/skills` | Two-axis review (Standards + Spec) of diffs prior to committing/merging. |
| [`improve-codebase-architecture`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/improve-codebase-architecture/SKILL.md) | `/improve-codebase-architecture` | `mattpocock/skills` | Identifies codebase deepening opportunities and architectural seams. |
| [`resolving-merge-conflicts`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/resolving-merge-conflicts/SKILL.md) | `/resolving-merge-conflicts` | `mattpocock/skills` | Resolves git merge/rebase conflicts by intent traced to primary sources. |
| [`prototype`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/prototype/SKILL.md) | `/prototype` | `mattpocock/skills` | Builds throwaway prototypes to quickly answer state model or UI questions. |
| [`research`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/research/SKILL.md) | `/research` | `mattpocock/skills` | Background research agent gathering facts from primary sources into cited docs. |

---

## 3. Productivity, Workflow & Coordination

| Skill | Trigger / Command | Source | Description |
|---|---|---|---|
| [`ask-matt`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/ask-matt/SKILL.md) | `/ask-matt` | `mattpocock/skills` | Interactive router helping choose the right skill or workflow path for any situation. |
| [`i-have-adhd`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/i-have-adhd/SKILL.md) | `/i-have-adhd` | `cesarchavezcal/personal-skills` | Action-first, numbered, zero-fluff communication style prioritizing momentum. |
| [`to-questionnaire`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/to-questionnaire/SKILL.md) | `/to-questionnaire` | `mattpocock/skills` | Creates structured questionnaires for third parties when decisions require external input. |
| [`wizard`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/wizard/SKILL.md) | `/wizard` | `mattpocock/skills` | Generates interactive bash wizards for steps only humans can perform (secrets, cloud UI). |
| [`wait-what`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/wait-what/SKILL.md) | `/wait-what` | `mattpocock/skills` | Clarifies confusing responses by re-pitching in plain English using project vocabulary. |
| [`teach`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/teach/SKILL.md) | `/teach` | `mattpocock/skills` | Multi-session workspace-based pedagogical framework for learning new concepts. |
| [`triage`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/triage/SKILL.md) | `/triage` | `mattpocock/skills` | State-machine triage workflow for categorizing and structuring external issues/PRs. |
| [`handoff`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/handoff/SKILL.md) | `/handoff` | `mattpocock/skills` | Generates structured context handoff files for cross-agent or session transitions. |
| [`claude-handoff`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/claude-handoff/SKILL.md) | `/claude-handoff` | `mattpocock/skills` | Claude-specific session handoff helper. |
| [`loop-me`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/loop-me/SKILL.md) | `/loop-me` | `mattpocock/skills` | Iterative grilling workflow for spec creation within workspace. |

---

## 4. Tooling, Scaffolding & Setup

| Skill | Trigger / Command | Source | Description |
|---|---|---|---|
| [`setup-matt-pocock-skills`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/setup-matt-pocock-skills/SKILL.md) | `/setup-matt-pocock-skills` | `mattpocock/skills` | Configures issue tracker, triage labels, and doc layout for engineering skills. |
| [`setup-pre-commit`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/setup-pre-commit/SKILL.md) | `/setup-pre-commit` | `mattpocock/skills` | Configures Husky pre-commit hooks, lint-staged, formatting, and test hooks. |
| [`setup-ts-deep-modules`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/setup-ts-deep-modules/SKILL.md) | `/setup-ts-deep-modules` | `mattpocock/skills` | Sets up dependency-cruiser for enforcing deep module encapsulation in TypeScript. |
| [`migrate-to-shoehorn`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/migrate-to-shoehorn/SKILL.md) | `/migrate-to-shoehorn` | `mattpocock/skills` | Migrates test assertions from `as` casting to `@total-typescript/shoehorn`. |
| [`git-guardrails-claude-code`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/git-guardrails-claude-code/SKILL.md) | `/git-guardrails` | `mattpocock/skills` | Git guardrails configuration and review conventions. |
| [`scaffold-exercises`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/scaffold-exercises/SKILL.md) | `/scaffold-exercises` | `mattpocock/skills` | Scaffolds exercise directories with sections, problems, solutions, and explainers. |

---

## 5. Writing & Documentation

| Skill | Trigger / Command | Source | Description |
|---|---|---|---|
| [`writing-for-agents`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/writing-for-agents/SKILL.md) | `/writing-for-agents` | `mattpocock/skills` | Reference for drafting documents consumed by AI agents (`AGENTS.md`, `CLAUDE.md`, skills). |
| [`writing-beats`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/writing-beats/SKILL.md) | `/writing-beats` | `mattpocock/skills` | Structured writing flow: builds a sequence of beats, grounding terminology before usage. |
| [`writing-fragments`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/writing-fragments/SKILL.md) | `/writing-fragments` | `mattpocock/skills` | Exploratory writing flow: mining raw concepts and unformed notes. |
| [`writing-shape`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/writing-shape/SKILL.md) | `/writing-shape` | `mattpocock/skills` | Polished writing flow: shaping raw fragments into cohesive paragraphs. |
