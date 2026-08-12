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
├── AGENTS.md               # Primary operational rules & 7-step pipeline sequence
├── SKILLS.md               # Skill catalog & npx skills stack discovery
├── CONTEXT.md              # Project domain definition & tech stack
├── MEMORY.md               # Durable memory & architectural decision records
└── docs/
    └── product-design/     # Output directory for /product-function, /ia, and /ooux specs
```

---

## 4. Key Conventions & Design System

- **Styling**: Use Vanilla CSS / Tailwind utility classes.
- **Components**: Functional React/Framework components with explicit prop interfaces.
- **Formatting**: Actionable microcopy, accessible focus indicators, and reduced-motion support.
