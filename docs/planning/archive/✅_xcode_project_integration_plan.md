# Implementation Plan: First-Class Xcode & Swift Project Integration

Enable seamless, out-of-the-box support for Xcode projects, SwiftUI apps, and Swift Packages within the `agent-boilerplate` harness.

---

## 1. Goal Description

Currently, `agent-boilerplate` has general stack detection and Node/Python/Rust/Go entries, but lacks explicit Xcode and Swift build/test primitives. 
This plan configures the 5 critical integration seams so any AI agent running in this repository can initialize, verify, test, and design Xcode projects reliably:

1. **Verification Barrier (`init.sh`)**: Auto-detects Swift Package (`Package.swift`) or Xcode projects (`*.xcodeproj` / `*.xcworkspace`) to run `swift test` or `xcodebuild test`.
2. **Stack Auto-Detection (`scripts/setup-project.sh`)**: Detects `Package.swift`, `*.xcodeproj`, `*.xcworkspace`, `project.yml` (XcodeGen), or `Project.swift` (Tuist) and queries Swift/iOS skills.
3. **Repository Cleanliness (`.gitignore`)**: Ignores `DerivedData/`, `.build/`, `*.xcuserstate`, and `xcuserdata/`.
4. **Pre-Commit AI Review (`.gga`)**: Extends `FILE_PATTERNS` to evaluate `*.swift` files while excluding `*Tests.swift`.
5. **Design System Linking (`DESIGN-swiftui.md`)**: Connects SwiftUI UI generation directly to [`docs/product-design/design/DESIGN-swiftui.md`](file:///Users/cesaradalbertochavezcalderon/Personal/agent-boilerplate/docs/product-design/design/DESIGN-swiftui.md).

---

## 2. Proposed Changes

### Component 1: Verification Barrier (`init.sh`)
Add smart auto-detection for Swift and Xcode projects:
- If `Package.swift` exists: executes `swift test`.
- If `*.xcworkspace` or `*.xcodeproj` exists: executes `xcodebuild test` with scheme detection and headless simulator destination (`platform=iOS Simulator,name=iPhone 16` or macOS).

```bash
# Swift / Xcode Detection
if [ -f "Package.swift" ]; then
    echo "Running Swift Package tests..."
    swift test
elif compgen -G "*.xcworkspace" > /dev/null || compgen -G "*.xcodeproj" > /dev/null; then
    SCHEME=$(xcodebuild -list -json 2>/dev/null | grep -o '"name": "[^"]*"' | head -1 | cut -d'"' -f4 || echo "")
    if [ -n "$SCHEME" ]; then
        echo "Running Xcode tests for scheme: $SCHEME..."
        xcodebuild test -scheme "$SCHEME" -destination "generic/platform=iOS Simulator" -quiet || xcodebuild test -scheme "$SCHEME" -destination "platform=macOS" -quiet
    fi
fi
```

---

### Component 2: Stack Auto-Detection (`scripts/setup-project.sh`)
Add detection for Apple ecosystem project files:
```bash
if [ -f "Package.swift" ] || compgen -G "*.xcodeproj" > /dev/null || compgen -G "*.xcworkspace" > /dev/null || [ -f "project.yml" ] || [ -f "Project.swift" ]; then
    echo "  ✓ Found Swift / Xcode project manifest"
    DETECTED_STACK="$DETECTED_STACK swift swiftui ios"
fi
```

---

### Component 3: Git Ignore (`.gitignore`)
Add standard Xcode & Swift ignores:
```gitignore
# Xcode & Apple Developer
DerivedData/
*.xcuserstate
*.xcodeproj/xcuserdata/
*.xcodeproj/project.xcworkspace/xcuserdata/
*.xcworkspace/xcuserdata/
.build/
Packages/
```

---

### Component 4: Pre-Commit AI Review (`.gga`)
Add `*.swift` to `FILE_PATTERNS` and test exclusion:
```ini
FILE_PATTERNS="*.ts,*.tsx,*.js,*.jsx,*.swift"
EXCLUDE_PATTERNS="*.test.ts,*.spec.ts,*.test.tsx,*.spec.tsx,*.d.ts,*Tests.swift,*Test.swift"
```

---

### Component 5: Documentation & Onboarding Guides (`README.md` & `AGENTS.md`)
- Update `README.md` with an **Xcode & SwiftUI Quickstart** section showing how to initialize an iOS/macOS app with this template.
- Highlight the connection between `/autonomic`, `/init-project`, and `docs/product-design/design/DESIGN-swiftui.md`.

---

## 3. Verification Plan

### Automated Tests
- Run `node .agents/skills/harness-creator/scripts/validate-harness.mjs --target .` to confirm 100/100 score.
- Verify shell syntax of `init.sh` and `scripts/setup-project.sh` via `bash -n`.

### Manual Verification
- Verify `.gga config` parses the updated `FILE_PATTERNS`.
- Confirm `.gitignore` properly tracks test and ignore patterns.
