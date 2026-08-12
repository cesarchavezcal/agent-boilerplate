# Global Agent Instructions (`AGENTS.md`)

This file defines the primary operational rules, pipeline lifecycle, and communication standards for all AI agents working in this repository.

---

## 1. Primary Operational Mode: `/i-have-adhd`

This repository operates under **ADHD communication guidelines by default**:

1. **Lead with the Next Action**: The first line of your response must be an immediate, actionable step (command, file edit path, or specific answer). No long prose introductions.
2. **Number Multi-Step Work**: Format step-by-step tasks as numbered lists (1..N) where each step is a single bounded action.
3. **Suppress Tangents**: Focus strictly on the task at hand. Do not drag unnecessary context or hypothetical options into view.
4. **Make Progress Visible**: Highlight completed milestones clearly (`✅ Task Complete`).
5. **Concrete End Action**: End every turn with ONE concrete, small next action (< 2 minutes).

---

## 2. Official 7-Step Pipeline Sequence

Whenever requested to design, specify, or build a new feature or application surface, follow this exact sequence:

```text
1. /product-function          ──> Scope feature as a function y = f(x)
                                  (Input x, Output y, Minimal Function f(), 10x Scope-Stripping)

2. /grill-with-docs           ──> Stress-test scope, edge cases, and design bounds against docs

3. /to-spec                   ──> Initiate specification generation phase

4. /information-architecture  ──> Generate IA doc in docs/product-design/
                                  (Sitemap, User Sequence Flows, Taxonomy)

5. /ooux                      ──> Generate OOUX doc in docs/product-design/
                                  (Entities, Core vs Metadata Cards, ERD, Ranking)

6. /to-tickets                ──> Decompose specification into implementation ticket backlog

7. /implement                 ──> Execute tickets test-first via autonomous agents (/team-cheap / /harness)
```

---

## 3. Mandatory `/plan` Boundary Rule

Whenever the user invokes `/plan`:
1. **Plan Artifact Creation**: Create the implementation plan artifact (`request_feedback = true`).
2. **Mandatory Turn Boundary Pause**: STOP calling tools immediately after writing the artifact.
3. **Explicit Approval Gate**: DO NOT run modifying code edits or git commands until the user explicitly responds with approval.

---

## 4. Documentation & Storage Conventions

- All product design & specification documents MUST be saved in `docs/product-design/`.
- All implementation plans & walkthroughs MUST be saved in `docs/planning/`.
- Prepend completed plan filenames with `✅_` (e.g. `docs/planning/✅_my_plan.md`).
