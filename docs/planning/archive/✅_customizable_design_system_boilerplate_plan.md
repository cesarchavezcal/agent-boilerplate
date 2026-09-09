# Implementation Plan: Customizable Design System Boilerplate Integration

Integrate the `docs/product-design/design/` directory as the official, customizable **Design System Specification & Boilerplate** across `/autonomic`, `/init-project`, UI/UX skills, and repository governance.

---

## 1. Goal Description

The repository now includes a production-grade design system boilerplate in `docs/product-design/design/` (featuring `DESIGN.md`, `README.md`, `DESIGN-swiftui.md`, `DESIGN-expo.md`, and `DESIGN-android.md`). 

This plan defines how:
1. **Agents reference this design system**: The autonomous builder (`/autonomic`), UI/UX skills (`/ia`, `/ooux`, `ui-ux-pro-max`, `shadcn`), and `/harness` read `docs/product-design/design/DESIGN.md` to build pixel-perfect, cohesive UI components.
2. **Agents dynamically customize the design system**: During `/init-project` or early design phases, the agent tailors visual atmosphere, colors, typography, component rules, and platform companions to match the specific project and user requirements.
3. **Documentation and storage governance**: Explicitly updates `AGENTS.md`, `README.md`, and `autonomic/SKILL.md` to formalize the role of `docs/product-design/design/`.

---

## 2. User Review Required

> [!NOTE]
> `docs/product-design/design/` currently contains a fintech/high-contrast mobile design system reference (Cash App). 
> The integration establishes this as the starting boilerplate that agents will customize and adapt according to the project's chosen tech stack (Web/React/Next.js vs React Native/Expo vs SwiftUI/Android) and brand identity.

---

## 3. Proposed Changes

### Component 1: Autonomous Orchestrator (`autonomic/SKILL.md`)
- Update Step 5 (Architecture & Design) and Step 7 (Harness Execution) to explicitly read and apply the design system in `docs/product-design/design/`.
- If the project requires customization (new theme, different colors, new component tokens), `/autonomic` adapts `docs/product-design/design/DESIGN.md` before generating UI code.

### Component 2: Project Onboarding (`init-project/SKILL.md`)
- Add a step during onboarding to check if the user wants to retain, adapt, or completely customize the boilerplate design system in `docs/product-design/design/`.
- Scaffold web-companion files (e.g., `DESIGN-web-tailwind.md`) if a web stack is selected.

### Component 3: Global Agent Instructions (`AGENTS.md`)
- Update Section 4 (`Documentation & Storage Conventions`) to document `docs/product-design/design/` as the canonical source for design system tokens, typography, visual atmosphere, and component styling.
- Update Section 6 (`Core Coding Standards`) under Container-Presentational Separation to mandate referencing `docs/product-design/design/DESIGN.md` for styling tokens.

### Component 4: Repository Documentation (`README.md`)
- Update the Documentation Conventions section to include `docs/product-design/design/`.
- Update Key Features to highlight the Customizable Design System Boilerplate.

---

## 4. Verification Plan

### Automated Tests
- Run `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .` to ensure 100/100 harness score.
- Run `./init.sh` to confirm project health.

### Manual Verification
- Verify that all references to `docs/product-design/design/` in `AGENTS.md`, `README.md`, and `autonomic/SKILL.md` are clickable and accurate.
