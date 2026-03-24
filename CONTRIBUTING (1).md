# Contributing to AgriSnapp 🌾

Thank you for your interest in contributing to AgriSnapp! This project was built during a hackathon at LUISS Guido Carli University and we're excited to grow it with the community. Every contribution — bug fixes, new features, documentation, or translations — helps us build better food security tools for farmers worldwide.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
  - [Prerequisites & Minimum Versions](#prerequisites--minimum-versions)
  - [Installation & Setup](#installation--setup)
  - [Environment Configuration](#environment-configuration)
- [Development Workflow](#development-workflow)
- [Code Style & Linting](#code-style--linting)
- [Project Structure](#project-structure)
- [Submitting a Contribution](#submitting-a-contribution)
- [Reporting Bugs](#reporting-bugs)
- [Feature Requests](#feature-requests)

---

## Code of Conduct

This project follows an open, welcoming environment. Please be respectful in all interactions. We're a student-led project and genuinely appreciate contributions at all experience levels.

---

## Getting Started

### Prerequisites & Minimum Versions

Before contributing, make sure your environment meets these **minimum version requirements**:

| Tool | Minimum Version | Check Command |
|------|----------------|---------------|
| Flutter | **3.29.0** (ships with Dart 3.9.x) | `flutter --version` |
| Dart SDK | **3.9.2** | `dart --version` |
| Android Studio | **Flamingo (2022.2)** or later | — |
| Xcode *(iOS/macOS only)* | **14.0** or later | `xcodebuild -version` |
| Android SDK | API level **21** (Android 5.0) minimum | — |
| iOS Deployment Target | **13.0** minimum | — |
| Git | **2.30** or later | `git --version` |
| Node.js *(web target only)* | **18.0** or later | `node --version` |

> ⚠️ The project requires **Dart SDK ^3.9.2** as declared in `pubspec.yaml`. Older Flutter installations will not satisfy this constraint. Run `flutter upgrade` to update both Flutter and the bundled Dart SDK together.

To verify your Flutter setup is healthy, run:

```bash
flutter doctor
```

All checks should pass (or show only non-critical warnings). Fix any issues `flutter doctor` reports before continuing.

---

### Platform-specific setup

#### Android

Ensure you have the Android SDK installed with at least API level 21. In Android Studio go to **SDK Manager → SDK Platforms** and install API 34 or later for the best development experience.

#### iOS / macOS

Xcode 14+ is required. After installing Xcode, run:

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

Then install CocoaPods (required for the Google Maps dependency):

```bash
sudo gem install cocoapods
```

#### Google Maps

AgriSnapp uses `google_maps_flutter`. Before the map screen will work you need a Google Maps API key with the **Maps SDK for Android** and **Maps SDK for iOS** enabled:

- **Android**: add your key to `android/app/src/main/AndroidManifest.xml`:
  ```xml
  <meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_KEY_HERE"/>
  ```
- **iOS**: add your key to `ios/Runner/AppDelegate.swift`:
  ```swift
  GMSServices.provideAPIKey("YOUR_KEY_HERE")
  ```

Store the key value itself in your `.env` file (see [Environment Configuration](#environment-configuration)) and never commit it directly to source.

---

### Installation & Setup

**1. Fork the repository**

Click the **Fork** button at the top-right of the [AgriSnapp repo](https://github.com/Google-Developers-Club-Guido-Carli/AgriSnapp), then clone your fork locally:

```bash
git clone https://github.com/<your-username>/AgriSnapp.git
cd AgriSnapp
```

**2. Add the upstream remote**

This lets you pull in future updates from the main repo:

```bash
git remote add upstream https://github.com/Google-Developers-Club-Guido-Carli/AgriSnapp.git
```

**3. Install Flutter dependencies**

```bash
flutter pub get
```

This installs all packages declared in `pubspec.yaml`:

| Package | Version | Purpose |
|---------|---------|---------|
| `http` | ^1.1.0 | Roboflow API requests |
| `image_picker` | ^1.0.7 | Camera & gallery access |
| `shared_preferences` | ^2.2.3 | Local data persistence |
| `translator` | ^1.0.0 | In-app translations |
| `google_maps_flutter` | ^2.5.0 | Community map screen |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

**4. Set up your environment file**

```bash
cp .env.example .env
```

Then open `.env` and fill in your keys — see [Environment Configuration](#environment-configuration) below.

**5. Verify the app runs**

Plug in a device or start an emulator, then:

```bash
flutter run
```

You should see the AgriSnapp home screen. If you hit errors, check `flutter doctor` output first and open an issue if the problem persists.

---

### Environment Configuration

Create a `.env` file in the project root. **Never commit this file** — it is already listed in `.gitignore`.

```env
# Roboflow — required for crop disease detection
ROBOFLOW_API_KEY=your_roboflow_key_here
ROBOFLOW_WORKSPACE=your_workspace
ROBOFLOW_PROJECT=your_project

# Google Maps — required for the community map screen
GOOGLE_MAPS_API_KEY=your_google_maps_key_here

# Optional — only needed if working on Firebase-backed features
FIREBASE_API_KEY=your_firebase_key
API_BASE_URL=https://your-api-endpoint.com
```

**Where do I get a Roboflow key?**
Sign up at [roboflow.com](https://roboflow.com), create a free account, and generate an API key under **Settings → API Keys**. The free tier is sufficient for local development.

**Where do I get a Google Maps key?**
Go to the [Google Cloud Console](https://console.cloud.google.com), create a project, enable the **Maps SDK for Android** and **Maps SDK for iOS**, and create an API key under **Credentials**.

---

## Development Workflow

**1. Sync with upstream before starting any new work:**

```bash
git fetch upstream
git checkout main
git merge upstream/main
```

**2. Create a feature branch** using a descriptive name:

```bash
# New feature
git checkout -b feature/offline-disease-cache

# Bug fix
git checkout -b fix/roboflow-timeout-error

# Documentation
git checkout -b docs/improve-setup-guide
```

**3. Make your changes**, committing in small, logical units.

We follow [Conventional Commits](https://www.conventionalcommits.org/) — prefix messages with one of:

| Prefix | When to use |
|--------|-------------|
| `feat:` | A new feature |
| `fix:` | A bug fix |
| `docs:` | Documentation only |
| `refactor:` | Code change with no behaviour change |
| `test:` | Adding or updating tests |
| `chore:` | Build process, dependencies, tooling |

Example:
```bash
git commit -m "feat: add offline caching for Roboflow responses"
```

**4. Run lint and format checks** before pushing (see [Code Style & Linting](#code-style--linting) below).

**5. Push and open a Pull Request** against `main`.

---

## Code Style & Linting

We use `flutter_lints` **5.0.0** (configured in `analysis_options.yaml`) together with `dart format` to keep the codebase consistent. **Run these checks before every commit or push** — the CI pipeline enforces them and will block merging if they fail.

### Analysing for lint errors

```bash
flutter analyze
```

All warnings and errors must be resolved before submitting a PR. The ruleset comes from `package:flutter_lints/flutter.yaml` — a curated set of recommended Flutter lints.

### Auto-formatting code

```bash
dart format .
```

This reformats all Dart files in place. There should be zero changes left after running it.

### Suppressing a lint for a single line

If you have a genuine reason to suppress a rule for one line (not just to silence a warning you don't understand), use the inline comment syntax:

```dart
// ignore: avoid_print
print('debug info');
```

For an entire file:

```dart
// ignore_for_file: avoid_print
```

If you think a rule should be changed project-wide, raise it in a PR or issue rather than suppressing it silently.

### Editor setup (recommended)

Configure your editor to format on save so you never have to think about it.

**VS Code** — install the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter), then add to `settings.json`:

```json
"[dart]": {
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "Dart-Code.dart-code"
}
```

**Android Studio / IntelliJ** — go to *Preferences → Languages & Frameworks → Flutter* and enable **Format code on save**.

### Pre-commit hook (optional but recommended)

This runs lint and format checks automatically before every commit. Create the file `.git/hooks/pre-commit`:

```bash
#!/bin/sh
echo "Running flutter analyze..."
flutter analyze
if [ $? -ne 0 ]; then
  echo "❌ Lint errors found. Fix them before committing."
  exit 1
fi

echo "Checking dart format..."
dart format --output=none --set-exit-if-changed .
if [ $? -ne 0 ]; then
  echo "❌ Formatting issues found. Run 'dart format .' to fix."
  exit 1
fi

echo "✅ All checks passed."
```

Make it executable:

```bash
chmod +x .git/hooks/pre-commit
```

---

## Project Structure

A quick orientation to help you find where things live:

```
lib/
├── main.dart                  # App entry point — routing and initialisation
├── roboflow_service.dart      # Roboflow API calls — start here for ML/detection changes
├── ai_insights.dart           # AI-generated insights UI and logic
├── community_map_screen.dart  # Google Maps community map feature
├── badge_system.dart          # Gamification / badges
├── privacy_manager.dart       # Privacy & data handling
├── translation_service.dart   # Translation logic (uses translator package)
└── translated_text.dart       # Reusable translated text widget
```

Not sure where your change belongs? Leave a comment on the relevant issue or ask in your PR — we're happy to help.

---

## Submitting a Contribution

Before opening a PR, run through this checklist:

- [ ] `flutter analyze` passes with zero errors
- [ ] `dart format .` produces no changes
- [ ] No API keys or secrets are committed (check `.env` is gitignored)
- [ ] New functionality has at least a basic widget or unit test in `test/`
- [ ] `flutter gen-l10n` has been run if you changed any localisation files
- [ ] Documentation updated if behaviour changed

When you open the PR:

- Fill out the PR template
- Link to the relevant issue with `Closes #<issue-number>` in the description
- Keep PRs focused — one feature or fix per PR makes review much faster

---

## Reporting Bugs

Open a [GitHub Issue](https://github.com/Google-Developers-Club-Guido-Carli/AgriSnapp/issues) and include:

- Your `flutter --version` output
- Your OS and target platform (Android / iOS / web)
- Steps to reproduce
- What you expected vs. what actually happened
- Relevant error output or screenshots

---

## Feature Requests

We'd love to hear your ideas. Open an issue with the label `enhancement` and describe:

- The problem you're trying to solve
- Your proposed solution
- Any relevant examples from similar tools

---

Built with ❤️ by GDSC LUISS Guido Carli — contributions from the community are what will take AgriSnapp from hackathon project to real-world impact.
