# Agent Skills Catalog (`SKILLS.md`)

This repository integrates custom agent skills, personal skills, Matt Pocock's skills, and `npx skills` auto-discovery.

---

## 1. Core Pipeline Skills

| Skill | Trigger / Command | Purpose | Source |
|---|---|---|---|
| **`product-function`** | `/product-function` | Scope feature as $y = f(x)$ with 10x Scope-Stripping | `personal-skills` |
| **`grill-with-docs`** | `/grill-with-docs`, `/grill` | Stress-test feature scope against docs & edge cases | `personal-skills` |
| **`information-architecture-review`** | `/information-architecture` | Generate Sitemap, User Sequence Diagrams & Taxonomy | `personal-skills` |
| **`ooux`** | `/ooux` | Extract Objects, Content vs Metadata, ERD & Forced Ranking | `personal-skills` |
| **`i-have-adhd`** | `/i-have-adhd` | Action-first, numbered, ADHD-optimised output style | `ayghri/i-have-adhd` |
| **`ui-ux-pro-max`** | `/ui-ux-pro-max` | UI design system, color tokens, typography & motion | `nextlevelbuilder` |
| **`ux-copy`** | `/ux-copy` | UX writing, microcopy, encouraging tone & CTAs | `anthropics` |

---

## 2. Autonomous Execution & Verification Skills

| Skill | Trigger / Command | Purpose | Source |
|---|---|---|---|
| **`harness`** | `/harness` | Single-ticket autonomous code-to-production pipeline | `personal-skills` |
| **`team-cheap`** | `/team-cheap` | Subagent fan-out orchestrator above `/harness` | `personal-skills` |
| **`code-review`** | `/code-review` | Parallel Standards & Spec code review pass | `personal-skills` |
| **`diagnosing-bugs`** | `/diagnosing-bugs` | Structured bug diagnosis & log extraction loop | `personal-skills` |
| **`find-skills`** | `/find-skills` | Discover & install stack-specific skills via `npx skills` | Open Ecosystem |

---

## 3. Dynamic Stack Skill Discovery

When initializing a new project with a specific technology stack (e.g., React, Next.js, Vue, Python, Supabase, Tailwind), run:

```bash
npx skills find [stack-keyword]
```

To install stack skills into your local agent environment:

```bash
npx skills add <owner/repo@skill-name> -g -y
```

### Recommended Stack Additions

- **React & Next.js**: `npx skills add vercel-labs/agent-skills@react-best-practices -g -y`
- **Web Guidelines**: `npx skills add vercel-labs/agent-skills@web-design-guidelines -g -y`
- **Database / Backend**: `npx skills add supabase/agent-skills@supabase -g -y`
