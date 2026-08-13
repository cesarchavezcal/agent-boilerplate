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

## 2. Official 7-Step Pipeline Sequence & `/init-project`

### Setup Phase (`/init-project`)
When initializing a fresh project repository:
1. **Base Skills Installation**: Run `npx skills@latest add mattpocock/skills -g -y` and verify `cesarchavezcal/personal-skills`. Reload skill context immediately.
2. **Auto-Stack Detection & Multi-Stage Interview**: Auto-detect existing project stack files (`package.json`, `pyproject.toml`, etc.), then execute pipeline steps 1–4 (`/product-function` -> `/grill-with-docs` -> `/to-spec` -> `/information-architecture`) to gather domain parameters and sitemap.
3. **Quad Auto-Population**: Populate [`CONTEXT.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/CONTEXT.md), [`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md), [`MEMORY.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/MEMORY.md), [`README.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/README.md), and [`SKILLS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/SKILLS.md) directly in place.
4. **Interactive Skill Discovery (`/find-skills`)**: Run `npx skills find` with stack and design inputs, present a ranked list in chat for user confirmation, install confirmed skills, and reload context.
5. **Baseline Git Setup**: Verify git user configuration (`cesarchavezcal`) and execute the Git Workflow (create branch `chore/CCH/initial-setup-{summary}`, commit, push PR).

### Feature Development Pipeline (7-Step Sequence)
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
- **PR Labels**: Check `.github/workflows/` or `.github/*.yml` for required preview app PR labels and apply them.
