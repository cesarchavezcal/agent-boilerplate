# Implementation Plan: Xcode Adoption Workflows (Template-First vs. Existing Project)

Provide clear documentation, tooling, and scripts for adopting `agent-boilerplate` into Xcode projects.

---

## 1. The Two Workflows: Which One to Choose?

### Approach A: Template-First (Recommended for New Projects)
Create the repo from the template first, then create the Xcode project inside it:

1. **Create the Repo**:
   ```bash
   gh repo create my-ios-app --template cesarchavezcal/agent-boilerplate --public --clone
   cd my-ios-app
   ```
2. **Create the Xcode Project inside the folder**:
   - **Option 1 (Xcode GUI)**: Open Xcode ➔ *File > New > Project* ➔ Select iOS App ➔ Choose `my-ios-app` folder as the location.
   - **Option 2 (XcodeGen CLI)**: Define `project.yml` and run `xcodegen generate`.
   - **Option 3 (Swift Package)**: Run `swift package init --type executable`.
3. **Run `/init-project`**:
   The agent detects the Xcode project, runs the Design Interview, configures `init.sh`, and opens the onboarding PR.

**Why this is cleanest**: Keeps git history completely linear without needing `--allow-unrelated-histories`.

---

### Approach B: Existing Project First (For Pre-Existing Xcode Projects)
If you already have an active Xcode project and repository:

1. **Option B1: Git Remote Merge**:
   ```bash
   cd /path/to/MyExistingXcodeApp
   git remote add boilerplate https://github.com/cesarchavezcal/agent-boilerplate.git
   git fetch boilerplate
   git merge boilerplate/main --allow-unrelated-histories -m "chore: adopt agent-boilerplate harness"
   ```

2. **Option B2: Non-Git Copy via `degit`**:
   ```bash
   cd /path/to/MyExistingXcodeApp
   npx degit cesarchavezcal/agent-boilerplate --force
   ```

3. **Initialize the Harness**:
   Run `/init-project` or `./init.sh` to verify tests and configure skills.

---

## 2. Proposed Changes

1. **Add `scripts/adopt.sh`**:
   A lightweight one-liner script that existing Xcode projects can run to copy the harness (`AGENTS.md`, `init.sh`, `.gga`, `docs/`, `.agents/`) without polluting git history:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/cesarchavezcal/agent-boilerplate/main/scripts/adopt.sh | bash
   ```

2. **Update `README.md`**:
   Add dedicated **Xcode & iOS Quickstart** section detailing both Approach A (New Project) and Approach B (Existing Project).

3. **Configure Xcode Primitives**:
   Implement the Xcode detection, `.gitignore`, `.gga`, and `init.sh` test runner from the previous plan.

---

## 3. Verification Plan

### Automated Tests
- Run `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .` (100/100).
- Test `scripts/adopt.sh` syntax with `bash -n`.

### Manual Verification
- Verify that `init.sh` correctly identifies Xcode schemes.
