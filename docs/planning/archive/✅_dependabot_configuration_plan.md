# Implementation Plan: Dependabot Configuration for Agent Boilerplate

Configure `.github/dependabot.yml` to establish automated dependency management aligned with repository conventions, and provide stack-agnostic template definitions for downstream projects.

---

## Goal Description

GitHub Dependabot was added to the repository with an empty package ecosystem placeholder (`package-ecosystem: ""`), causing validation warnings on GitHub. 

Because `agent-boilerplate` is an uninitialized starter template designed to be initialized into any stack (Node, Python, Go, Rust, Swift, etc.) via `/init-project`, Dependabot must:
1. Actively monitor repository-level dependencies that already exist or belong to the platform (specifically `github-actions`).
2. Adhere strictly to the repository's conventional commit style (`chore(deps): ...`) and existing PR labels (`chore`).
3. Include commented ecosystem templates for downstream stacks (npm, pip, cargo, gomod, swift) ready for activation.
4. Optionally establish a minimal GitHub Actions verification workflow (`.github/workflows/verify.yml`) that runs `./init.sh` and harness validation, providing Dependabot with active actions to maintain while enforcing CI checks on pull requests.

---

## User Review Required

> [!IMPORTANT]
> **Active Ecosystem vs. Downstream Templates**:
> In this boilerplate template, there is no root `package.json` or language manifest (by design, until `/init-project` is run). Enabling `package-ecosystem: "npm"` immediately would cause Dependabot to fail with `"Dependabot could not find a package.json file"`. Therefore, `github-actions` is set as the active ecosystem, with common stack ecosystems provided as ready-to-uncomment templates.

> [!NOTE]
> **GitHub Actions CI Workflow**:
> We propose creating `.github/workflows/verify.yml` so the repository has baseline CI checks (`./init.sh` and harness validation 100/100) and Dependabot has live action versions (`actions/checkout@v4`, `actions/setup-node@v4`) to monitor.

---

## Open Questions

None. The requirements align with GitHub's Dependabot v2 schema and repository guidelines in [`AGENTS.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/AGENTS.md).

---

## Proposed Changes

### GitHub Configuration

#### [MODIFY] [`.github/dependabot.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/dependabot.yml)
- Replace empty placeholder with active `package-ecosystem: "github-actions"`.
- Configure `schedule`: weekly on Monday at 06:00 (America/Mexico_City).
- Configure `commit-message`: prefix `chore`, include `scope`.
- Configure `labels: ["chore"]` matching [`.github/labels.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/labels.yml).
- Add commented template blocks for `npm`, `pip`, `cargo`, `gomod`, and `swift`.

```yaml
version: 2
updates:
  # Maintain GitHub Actions dependencies
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "06:00"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 10
    commit-message:
      prefix: "chore"
      include: "scope"
    labels:
      - "chore"

  # ---------------------------------------------------------------------------
  # Downstream Project Ecosystems
  # When initializing this repository for a specific stack via /init-project,
  # uncomment and adapt the matching ecosystem block below:
  # ---------------------------------------------------------------------------

  # Node / JavaScript / TypeScript (npm / yarn / pnpm)
  # - package-ecosystem: "npm"
  #   directory: "/"
  #   schedule:
  #     interval: "weekly"
  #   commit-message:
  #     prefix: "chore"
  #     include: "scope"
  #   labels:
  #     - "chore"

  # Python (pip / poetry / pipenv)
  # - package-ecosystem: "pip"
  #   directory: "/"
  #   schedule:
  #     interval: "weekly"
  #   commit-message:
  #     prefix: "chore"
  #     include: "scope"
  #   labels:
  #     - "chore"

  # Rust (cargo)
  # - package-ecosystem: "cargo"
  #   directory: "/"
  #   schedule:
  #     interval: "weekly"
  #   commit-message:
  #     prefix: "chore"
  #     include: "scope"
  #   labels:
  #     - "chore"

  # Go (gomod)
  # - package-ecosystem: "gomod"
  #   directory: "/"
  #   schedule:
  #     interval: "weekly"
  #   commit-message:
  #     prefix: "chore"
  #     include: "scope"
  #   labels:
  #     - "chore"

  # Swift / iOS (swift)
  # - package-ecosystem: "swift"
  #   directory: "/"
  #   schedule:
  #     interval: "weekly"
  #   commit-message:
  #     prefix: "chore"
  #     include: "scope"
  #   labels:
  #     - "chore"
```

---

### CI Workflows

#### [NEW] [`.github/workflows/verify.yml`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.github/workflows/verify.yml)
- Create a baseline CI workflow running on pull requests and pushes to `main`.
- Runs `./init.sh` and `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .`.
- Employs `actions/checkout@v4` and `actions/setup-node@v4`.

```yaml
name: Verify

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Run project verification
        run: ./init.sh

      - name: Validate agent harness
        run: node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .
```

---

### Onboarding Skill Integration

#### [MODIFY] [`.agents/skills/init-project/SKILL.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/.agents/skills/init-project/SKILL.md)
- In Step 5 (Populate Project Quad Files), add an instruction to enable the corresponding package ecosystem in `.github/dependabot.yml` based on the detected or chosen stack.

---

## Verification Plan

### Automated Tests
1. **Harness Integrity**:
   ```bash
   node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .
   ```
   Ensure score remains 100/100.
2. **Project Initialization Script**:
   ```bash
   ./init.sh
   ```
   Verify exit code 0.
3. **YAML Schema Validation**:
   Validate syntax of `.github/dependabot.yml` and `.github/workflows/verify.yml` using Node or python yaml parser:
   ```bash
   python3 -c "import yaml; yaml.safe_load(open('.github/dependabot.yml')); yaml.safe_load(open('.github/workflows/verify.yml')); print('YAML valid')"
   ```

### Manual Verification
1. Verify GitHub recognizes Dependabot configuration without errors once pushed.
2. Verify GitHub Actions workflow runs cleanly on the PR.
