# Agent Boilerplate Template

A lightweight, stack-agnostic GitHub Repository Template pre-configured for AI agent-driven software development with Google Antigravity.

---

## Features

- **Automatic Session-Start Onboarding (`/init-project`)**: Auto-detects uninitialized projects and runs an automated setup interview, populating project quad files, base skills (`mattpocock/skills`), and stack skills.
- **Official 7-Step Pipeline Sequence**: Built-in governance for turning ideas into production code (`/product-function` -> `/grill-with-docs` -> `/to-spec` -> `/information-architecture` -> `/ooux` -> `/to-tickets` -> `/implement`).
- **Strict Git & PR Conventions**: Enforced branch naming (`{prefix}/CCH/{project-initials}-{ticket-number}-{ticket-summary}`), Conventional Commits (`<prefix>(<scope>): <summary>`), and high-level PR descriptions.
- **`/i-have-adhd` Mode Default**: Action-first, numbered, direct communication style that eliminates fluff and keeps work momentum high.
- **Agent Document Quad**: Pre-structured `AGENTS.md`, `SKILLS.md`, `CONTEXT.md`, and `MEMORY.md`.

---

## How to Use This Template

### 1. Create a New Repository
Click **"Use this template"** on GitHub, or run via GitHub CLI:

```bash
gh repo create my-new-app --template cesarchavezcal/agent-boilerplate --public --clone
cd my-new-app
```

### 2. Run Automated Initial Setup (`/init-project`)
Start an agent session in your new workspace. The agent will automatically detect uninitialized context and prompt you to run `/init-project`, or you can execute:

```text
/init-project
```

This workflow will:
1. Auto-detect project stack files (`package.json`, `pyproject.toml`, etc.)
2. Install base skills (`mattpocock/skills`) & reload context
3. Interview you using pipeline steps 1–4 (`/product-function` -> `/grill-with-docs` -> `/to-spec` -> `/information-architecture`)
4. Populate [`CONTEXT.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/CONTEXT.md), [`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md), [`MEMORY.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/MEMORY.md), [`README.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/README.md), and [`SKILLS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/SKILLS.md) directly in place
5. Search stack skills via `npx skills find`, ask for confirmation in chat, and install them
6. Create an initial setup branch (`chore/CCH/initial-setup-project-context`) and PR

### 3. Execute the 7-Step Feature Pipeline
Tell the agent to build any feature or application surface:

```text
1. /product-function          ──> Scope feature as a function y = f(x)
2. /grill-with-docs           ──> Stress-test scope & edge cases against docs
3. /to-spec                   ──> Initiate specification generation phase
4. /information-architecture  ──> Generate IA doc (Sitemap, User Sequence Flows, Taxonomy)
5. /ooux                      ──> Generate OOUX doc (Entities, Core vs Metadata, ERD, Ranking)
6. /to-tickets                ──> Decompose spec into implementation ticket backlog
7. /implement                 ──> Execute tickets test-first via autonomous agents (/team-cheap / /harness)
```
