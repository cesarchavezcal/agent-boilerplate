# Agent Boilerplate Template

A lightweight, stack-agnostic GitHub Repository Template pre-configured for AI agent-driven software development with Google Antigravity.

---

## Features

- **Official 7-Step Pipeline Sequence**: Built-in governance for turning ideas into production code (`/product-function` -> `/grill-with-docs` -> `/to-spec` -> `/information-architecture` -> `/ooux` -> `/to-tickets` -> `/implement`).
- **`/i-have-adhd` Mode Default**: Action-first, numbered, direct communication style that eliminates fluff and keeps work momentum high.
- **Agent Document Quad**: Pre-structured `AGENTS.md`, `SKILLS.md`, `CONTEXT.md`, and `MEMORY.md`.
- **Dynamic Stack Skill Discovery**: Helper scripts and guidance to auto-detect and add stack-specific skills (`react`, `nextjs`, `supabase`, `playwright`, `tailwind`) via `npx skills`.
- **Personal Skills Integration**: Linked with [`cesarchavezcal/personal-skills`](https://github.com/cesarchavezcal/personal-skills).

---

## How to Use This Template

### 1. Create a New Repository
Click **"Use this template"** on GitHub, or run via GitHub CLI:

```bash
gh repo create my-new-app --template cesarchavezcal/agent-boilerplate --public --clone
cd my-new-app
```

### 2. Configure Project Context
Fill out `CONTEXT.md` with your new application's domain overview and tech stack.

### 3. Install Stack Skills
Auto-discover and install skills tailored to your tech stack:

```bash
bash scripts/init-skills.sh [stack-keyword]
```

### 4. Execute the 7-Step Pipeline
Tell the agent to build a new feature or app surface:

```text
1. /product-function          ──> Scope feature as a function y = f(x)
2. /grill-with-docs           ──> Stress-test scope & edge cases against docs
3. /to-spec                   ──> Initiate specification generation phase
4. /information-architecture  ──> Generate IA doc (Sitemap, User Sequence Flows, Taxonomy)
5. /ooux                      ──> Generate OOUX doc (Entities, Core vs Metadata, ERD, Ranking)
6. /to-tickets                ──> Decompose spec into implementation ticket backlog
7. /implement                 ──> Execute tickets test-first via autonomous agents (/team-cheap / /harness)
```
