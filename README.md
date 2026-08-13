# Agent Boilerplate Template

A lightweight, stack-agnostic GitHub Repository Template pre-configured for AI agent-driven software development across any AI environment (Google Antigravity, Cursor, Claude Code, Windsurf, Aider, GitHub Copilot).

---

## Features

- **Universal AI Agent Compatibility**: Pre-configured with [`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md), [`.cursorrules`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.cursorrules), and [`CLAUDE.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/CLAUDE.md) so ANY AI agent automatically detects uninitialized context and executes onboarding setup.
- **One-Prompt Project Creation**: Prompt any AI agent with *"Create a project using cesarchavezcal/agent-boilerplate and complete the setup"* to initialize a complete repository end-to-end.
- **Automatic Session-Start Onboarding (`/init-project`)**: Auto-detects uninitialized projects and runs an automated setup interview, populating project quad files, base skills (`mattpocock/skills`), and stack skills.
- **Official 7-Step Pipeline Sequence**: Built-in governance for turning ideas into production code (`/product-function` -> `/grill-with-docs` -> `/to-spec` -> `/information-architecture` -> `/ooux` -> `/to-tickets` -> `/implement`).
- **Strict Git & PR Conventions**: Enforced branch naming (`{prefix}/CCH/{project-initials}-{ticket-number}-{ticket-summary}`), Conventional Commits (`<prefix>(<scope>): <summary>`), PR label auto-attaching, and high-level PR descriptions.
- **`/i-have-adhd` Mode Default**: Action-first, numbered, direct communication style that eliminates fluff and keeps work momentum high.

---

## One-Prompt Creation with Any AI Agent

Simply tell your AI agent:

> *"Create a new project named `my-awesome-app` using `cesarchavezcal/agent-boilerplate` and complete the setup."*

The AI agent will automatically:
1. Run `gh repo create my-awesome-app --template cesarchavezcal/agent-boilerplate --public --clone`
2. `cd my-awesome-app`
3. Execute `/init-project` (auto-detect stack, interview domain vision, populate [`CONTEXT.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/CONTEXT.md)/[`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md)/[`SKILLS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/SKILLS.md), install skills, and open setup PR)

---

## How to Use This Template Manually

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
6. Create an initial setup branch (`chore/CCH/initial-setup-project-context`) and open PR

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

---

## Git Workflow & PR Standards

All work in this repository MUST follow the mandatory 4-step Git Workflow Lifecycle:

```text
Create Branch ──> Make Changes & Commit ──> Push & Open PR ──> Merge into Base Branch
```

### Branch Naming Convention
- **Initial Setup**: `chore/CCH/initial-setup-{summary}`
- **Feature / Bug Work**: `{prefix}/CCH/{project-initials}-{ticket-number}-{ticket-summary}`

Where `{prefix}` is: `feature`, `bugfix`, or `chore`.

### Conventional Commits
Format: `<prefix>(<scope>): <summary>`  
Example: `feat(auth): add magic link login validation`

### PR Guidelines & Auto-Labels
PR descriptions focus on **WHAT was delivered in 2–4 concise sentences** without line-by-line implementation clutter. Standard PR labels (`feature`, `bugfix`, `chore`, `preview-app`) are automatically attached upon PR creation.

---

## Slash Commands Quick Reference

| Command | Purpose |
|---|---|
| `/init-project` | Run multi-stage onboarding interview, auto-detect stack, and populate quad files |
| `/product-function` | Model feature as $y = f(x)$ with 10x Scope-Stripping |
| `/grill-with-docs` | Stress-test feature scope and technical bounds against documentation |
| `/information-architecture` | Generate Sitemap, User Sequence Flows, and Taxonomy in `docs/product-design/` |
| `/ooux` | Extract Objects, Content vs Metadata, ERD, and Forced Ranking |
| `/find-skills` | Search open ecosystem skills via `npx skills find` with interactive selection |
| `/plan` | Generate implementation plan artifact with turn boundary pause & user approval gate |
| `/grill-me` | Interactive interview to resolve design decisions one by one |
| `/i-have-adhd` | Action-first, numbered, zero-fluff communication style |
