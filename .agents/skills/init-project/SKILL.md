---
name: init-project
description: Bootstrap a new repository created from agent-boilerplate. Use when starting a new project, when CONTEXT.md contains uninitialized placeholders ([Your Project Name]), or when asked to initialize/setup the project.
---

# Initialize Project (`/init-project`)

End-to-end onboarding workflow to turn an uninitialized template clone into an active, stack-provisioned repository with dynamically discovered skills and a tailored design system.

## Sequence

### 1. Inspect Placeholder State
Check [`CONTEXT.md`](../../CONTEXT.md) for placeholder string `[Your Project Name]`.
- **Criterion**: If already initialized (no placeholders), stop and report active project context. If placeholders exist, proceed.

### 2. Domain & Scoping Interview ($y = f(x)$)
Interview the human developer in chat using [`product-function`](../product-function/SKILL.md) principles:
- Identify input situation ($x$), desired outcome ($y$), and transformation function $f(x) \rightarrow y$.
- Determine runtime stack and test runner dynamically based strictly on the product requirements (e.g. Next.js, FastAPI, Go, SvelteKit, Supabase, React Native / Expo, etc.).
- **Criterion**: Developer explicitly confirms project name, one-sentence description, and selected tech stack keywords.

### 3. Stack Manifest & Dynamic 4-Category Skill Discovery
The template starts with zero predefined skills. The agent dynamically queries the open ecosystem across 4 pillars:

1. **Query Ecosystem via `npx skills find`**:
   - 🎨 **Design**: `npx skills find "<frontend-ui-keyword>"` (UI components, design systems, styling)
   - 💻 **Coding**: `npx skills find "<backend-framework-keyword>"` (architecture, ORM, framework patterns)
   - 🧪 **Testing**: `npx skills find "<test-framework-keyword>"` (TDD, assertions, E2E)
   - 🛠️ **Helpers / Infra**: `npx skills find "<infra-tooling-keyword>"` (deployment, Docker, database, hooks)

2. **Present Discovered Skills**: Present curated matches grouped by the 4 pillars to the developer with installation commands:
   ```bash
   npx skills add <chosen-package>
   ```

3. **Link Skills to Pipeline Phases**: Record installed skills in `openspec/config.yaml` and `.atl/skill-registry.md`, mapping each to its SDD/Autonomic step:
   - Design skills ➔ Step 2 (Design) & Step 5 (UI Apply)
   - Coding skills ➔ Step 3 (Specs) & Step 5 (TDD Implementation)
   - Testing skills ➔ Step 5 (Red Phase) & Step 6 (Verification)
   - Helper skills ➔ Step 6 (Audit/CI) & Step 7 (Deploy/PR)

4. **Bootstrap Project Workspace**:
   ```bash
   bash scripts/setup-project.sh "<selected-stack-keywords>"
   ```
- **Criterion**: Selected skills appear in `.agents/skills/` and `skills-lock.json`, and are mapped in `.atl/skill-registry.md`.

### 4. Design System & Platform Styling Interview
Interview the human developer to customize the design system boilerplate in `docs/product-design/design/`:

1. **Target Platform(s)**:
   - Web (React / Next.js / Tailwind)
   - Mobile Cross-Platform (Expo / React Native)
   - iOS Native (SwiftUI)
   - Android Native (Jetpack Compose)

2. **Visual Atmosphere & Theme Customization**:
   - **Theme & Atmosphere**: Minimalist SaaS, High-Contrast Dark, Clean Light, Playful/E-commerce, Brutalist.
   - **Color Roles**: Primary brand accent, canvas background, elevated surfaces, and semantic colors (success, error, warning).
   - **Typography**: Display/hero font, body font, and monospace font for tabular/metric figures.
   - **Component Styles**: Corner radii, borders vs soft shadows, CTA styles, motion curves, and haptics.

3. **Generate Tailored Design Specs**:
   - Update `docs/product-design/design/DESIGN.md` with the confirmed visual theme, color palette, typography hierarchy, and component rules.
   - Maintain and tailor the companion file(s) corresponding to the chosen platform(s):
     - `docs/product-design/design/DESIGN-web.md` (Web / Tailwind / CSS tokens)
     - `docs/product-design/design/DESIGN-expo.md` (React Native / Expo)
     - `docs/product-design/design/DESIGN-swiftui.md` (iOS SwiftUI)
     - `docs/product-design/design/DESIGN-android.md` (Android Jetpack Compose)
   - Update `docs/product-design/design/README.md` to reference the active project design spec.
- **Criterion**: `docs/product-design/design/DESIGN.md` reflects the project's brand identity, and the active platform companion exists and matches the stack.

### 5. Populate Project Quad & Governance Files
Replace all placeholder brackets `[...]` in place across quad and repository governance files:
1. `CONTEXT.md`: Write concrete Project Name, Purpose, Tech Stack table, and Architecture layout.
2. `AGENTS.md`: Add any stack-specific constraints, discovered skill roles, or coding standards.
3. `MEMORY.md`: Record initial domain decisions under `ADR-001`.
4. `README.md`: Set project title, description, and quickstart commands.
5. `SECURITY.md`: Replace `[Your Project Name]`, security email `[security@yourdomain.com]`, and repository advisory URL. Ensure supported versions table reflects initial version (`0.1.x` or `1.0.x`).
6. `.github/dependabot.yml`: Enable and configure the package ecosystem (`npm`, `pip`, `cargo`, `gomod`, `swift`, etc.) corresponding to the project's selected tech stack and manifest directory (uncommenting or injecting the ecosystem block while preserving `github-actions`).
- **Criterion**: Grep confirms zero instances of `[Your Project Name]` across root documentation files, and `.github/dependabot.yml` includes an active entry for the project's primary package ecosystem.

### 6. Initialize SDD Registry
Run `/sdd-init` to scan the new stack, configure `openspec/config.yaml`, and build [`.atl/skill-registry.md`](../../.atl/skill-registry.md).
- **Criterion**: `openspec/config.yaml` reflects the active project context, test runner, and discovered skills.

### 7. Create Initial Setup Branch & Pull Request
Execute standard 4-step Git lifecycle:
```bash
git checkout -b chore/CCH/initial-setup-project-context
git add .
git commit -m "chore(setup): initialize project context, stack scaffolding, design system, security policy, and dependabot"
git push -u origin chore/CCH/initial-setup-project-context
gh pr create --title "chore(setup): initialize project context, stack, and design system" --body "Initializes project quad and governance files (including SECURITY.md and dependabot.yml), provisions dynamic tech stack, customizes design system in docs/product-design/design/, and sets up SDD skill registry." --label "chore"
```
- **Criterion**: GitHub PR is open and linked in chat.
