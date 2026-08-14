# Project Context (`CONTEXT.md`)

This file holds the project's domain definition, architecture overview, and technology stack. Fill out these sections when initializing a new project from this boilerplate template.

---

## 1. Project Overview

- **Project Name**: `[Your Project Name]`
- **Domain / Description**: `[Brief 1-2 sentence description of what this application does]`
- **Target Audience / Mental Model**: `[Core user profile and mental model]`

---

## 2. Technology Stack

- **Frontend**: `[e.g., Next.js 16 (App Router), React 19, Tailwind CSS]`
- **Backend / Database**: `[e.g., Supabase Postgres, Node.js, Python FastAPI]`
- **Testing Framework**: `[e.g., Vitest, Jest, Playwright]`
- **Deployment Platform**: `[e.g., Vercel, Railway, Docker, AWS]`

---

## 3. Key Architecture & File Layout

```text
.
├── .atl/                   # Skill registry index (.atl/skill-registry.md)
├── .gga                    # Gentleman Guardian Angel AI code review configuration
├── .github/                # GitHub workflows, issue templates, and PR template
├── AGENTS.md               # Primary operational rules, SDD pipeline, & coding standards
├── CLAUDE.md               # Claude Code configuration pointer
├── CONTEXT.md              # Project domain definition & tech stack
├── MEMORY.md               # Durable memory & architectural decision records
├── SKILLS.md               # High-level skill catalog and dynamic discovery guide
├── openspec/               # Spec-Driven Development (specs/, changes/, config.yaml)
├── scripts/                # Dynamic stack setup and skill installation scripts
└── docs/
    ├── planning/           # Implementation plans and walkthroughs
    └── product-design/     # Product specs (/product-function, /ia, /ooux)
```

---

## 4. Key Conventions & Design System

- **Styling**: Use Vanilla CSS / Tailwind utility classes.
- **Components**: Functional React/Framework components with explicit prop interfaces.
- **Formatting**: Actionable microcopy, accessible focus indicators, and reduced-motion support.
