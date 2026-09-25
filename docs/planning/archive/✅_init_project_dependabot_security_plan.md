# Implementation Plan: Update `/init-project` for Dependabot & Security Policy

Update the repository templates and the `/init-project` skill workflow so that `.github/dependabot.yml` and `SECURITY.md` are established as standardized boilerplate files and automatically customized during project initialization.

---

## Goal Description

The repository now contains both `.github/dependabot.yml` and `SECURITY.md` on `main`. Currently:
1. `.github/dependabot.yml` has an unconfigured placeholder (`package-ecosystem: ""`).
2. `SECURITY.md` contains generic upstream GitHub sample text with arbitrary versions (`5.1.x`).
3. `.agents/skills/init-project/SKILL.md` only documents replacing placeholders in the Quad files (`CONTEXT.md`, `AGENTS.md`, `MEMORY.md`, `README.md`), leaving `dependabot.yml` and `SECURITY.md` unconfigured when a developer bootstraps a new project.

This change aligns both files as first-class governance templates and integrates their tailoring directly into the `/init-project` onboarding workflow.

---

## User Review Required

> [!IMPORTANT]
> **Boilerplate Defaults vs. Initialized Project State**:
> - In `agent-boilerplate`, `.github/dependabot.yml` will actively track `github-actions` (the only universal ecosystem prior to stack selection), and provide commented templates for common language package managers (`npm`, `pip`, `cargo`, `gomod`, `swift`).
> - In `agent-boilerplate`, `SECURITY.md` will provide clean `[Your Project Name]` and contact placeholders (`[security@yourdomain.com]`, advisory links).
> - When `/init-project` executes, it will replace these placeholders in `SECURITY.md` and activate the corresponding package ecosystem in `.github/dependabot.yml`.

> [!TIP]
> **GitHub Actions Verification**:
> We will also create a baseline [`.github/workflows/verify.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/workflows/verify.yml) running `./init.sh` and harness validation on pushes/PRs. This provides live action versions for Dependabot to monitor and ensures automated checks run on all PRs.

---

## Open Questions

None. The workflow follows the established `/init-project` lifecycle in [`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md).

---

## Proposed Changes

### Governance & Platform Configuration

#### [MODIFY] [`.github/dependabot.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/dependabot.yml)
- Configure active `package-ecosystem: "github-actions"` with weekly Monday schedule.
- Set conventional commit style: `prefix: "chore"` and `include: "scope"`.
- Set `labels: ["chore"]`.
- Include structured, commented templates for `npm`, `pip`, `cargo`, `gomod`, and `swift`.

#### [MODIFY] [`SECURITY.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/SECURITY.md)
- Replace generic upstream sample text with standard security policy template.
- Use placeholders `[Your Project Name]`, `[security@yourdomain.com]`, and `https://github.com/[owner]/[repo]/security/advisories/new`.
- Set initial supported version table to `0.1.x` (`:white_check_mark:`) and `< 0.1` (`:x:`).
- Define clear vulnerability reporting instructions and 48-hour response SLA.

#### [NEW] [`.github/workflows/verify.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/workflows/verify.yml)
- Create a lightweight verification workflow triggered on PRs and pushes to `main`.
- Runs `./init.sh` and `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .`.
- Employs `actions/checkout@v4` and `actions/setup-node@v4`.

---

### Onboarding Skill

#### [MODIFY] [`.agents/skills/init-project/SKILL.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/init-project/SKILL.md)
- **Update Step 5 Heading & Instructions**:
  Rename from `### 5. Populate Project Quad Files` to `### 5. Populate Project Quad & Governance Files`.
  Add explicit instructions for:
  - `SECURITY.md`: Replace project placeholders, contact email/advisory link, and declare supported versions.
  - `.github/dependabot.yml`: Enable and tailor the package ecosystem block matching the project's selected stack (`npm`, `pip`, `cargo`, `gomod`, `swift`, etc.) while keeping `github-actions` active.
- **Update Step 5 Acceptance Criterion**:
  Ensure grep confirms zero instances of `[Your Project Name]` in `SECURITY.md`, and verify `.github/dependabot.yml` contains an active package ecosystem entry.
- **Update Step 7 PR Message**:
  Include `SECURITY.md` and `dependabot.yml` in the generated PR title and body.

---

## Verification Plan

### Automated Tests
1. **Harness Score Validation**:
   ```bash
   node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .
   ```
   Must remain 100/100 across all 5 subsystems.
2. **Project Initialization Script**:
   ```bash
   ./init.sh
   ```
   Must exit 0.
3. **YAML Syntax Validation**:
   ```bash
   python3 -c "import yaml; yaml.safe_load(open('.github/dependabot.yml')); yaml.safe_load(open('.github/workflows/verify.yml')); print('YAML valid')"
   ```

### Manual Verification
1. Verify `SECURITY.md` renders cleanly as GitHub Flavored Markdown.
2. Verify `.agents/skills/init-project/SKILL.md` instructions are clear and sequential.
