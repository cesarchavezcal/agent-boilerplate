# Implementation Plan: Design System Interview in `/init-project`

Add a dedicated **Design System & Platform Styling Interview** step to `/init-project` to customize and generate the tailored design files in `docs/product-design/design/` for the selected platforms.

---

## 1. Goal Description

When initializing a new repository from `agent-boilerplate`, the user will be interviewed about:
1. **Target Platform(s)**: Web, Expo/React Native, SwiftUI, and/or Jetpack Compose.
2. **Visual Identity & Atmosphere**: Theme (Dark/Light/Neutral/Bold), Primary/Secondary color palette, Typography (Hero/Body/Mono), Corner radii, and Motion feel.

Based on this interview, the agent generates or customizes:
- `docs/product-design/design/DESIGN.md` (Framework-neutral master design spec)
- Target platform companion(s):
  - `docs/product-design/design/DESIGN-web.md` (Tailwind / CSS tokens / Web components)
  - `docs/product-design/design/DESIGN-expo.md` (React Native / Expo styling)
  - `docs/product-design/design/DESIGN-swiftui.md` (SwiftUI styling & view modifiers)
  - `docs/product-design/design/DESIGN-android.md` (Jetpack Compose themes & tokens)
- `docs/product-design/design/README.md` (Project design system index)

---

## 2. Proposed Changes

### Component 1: Update `/init-project` (`.agents/skills/init-project/SKILL.md`)
- Add **Step 3b: Design System & Platform Styling Interview**:
  1. Ask target platforms: Web, Expo, SwiftUI, Android.
  2. Ask visual theme: Colors, Dark vs Light mode defaults, Typography, Component style (flat, border-contrast, elevated shadows).
  3. Generate/replace files in `docs/product-design/design/` matching the project's identity and active platforms.

### Component 2: Update `/autonomic` (`.agents/skills/autonomic/SKILL.md`)
- In Step 5 (Architecture & Design) and Step 7 (Implementation), enforce that UI design must read `docs/product-design/design/DESIGN.md` and the active platform companion file to style components.

### Component 3: Update `AGENTS.md` & `README.md`
- Document the design interview step in `AGENTS.md` Section 0 (Onboarding) and Section 4 (Documentation Conventions).
- Update `README.md` to highlight the interactive design scaffolding during setup.

---

## 3. Verification Plan

### Automated Tests
- Run `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .` to confirm 100/100 score.
- Run `./init.sh` to confirm baseline test suite passes.

### Manual Verification
- Verify that `init-project/SKILL.md` contains clear completion criteria for the design interview and file generation.
