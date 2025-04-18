# Meow Status 🐾

An AI-powered chat experience built with Flutter, designed to express and reflect emotional states through a playful feline lens.

<img 
  src="https://raw.githubusercontent.com/aludmila-gdev/meow_status/master/assets/docs/gifs/meow_status_v0.gif" 
  alt="Meow Status Demo" 
  width="500" />

---

## 📚 Table of Contents

- [🐱 Project Overview](#-project-overview)
- [✨ Features](#-features)
- [🧱 Architecture Overview](#-architecture-overview)
- [🚀 Tech Stack](#-tech-stack)
- [📱 Platform Support](#-platform-support)
- [🛠️ Local Setup on macOS (Android)](#️-local-setup-on-macos-android)
- [📊 Development Commands](#-development-commands)
- [💬 How It Works](#-how-it-works)
- [🤝 Contributing](#-contributing)

---

## 🐱 Project Overview

**Meow Status** is a lightweight Flutter app where users interact with a Large Language Model (LLM) through a cat-themed chat interface. It's an experimental space to explore emotional reflection, live feedback, and streaming conversations with generative AI.

### ✨ Features

- Natural language input from the user
- Smart response bubbles with real-time rendering
- Gemini LLM integration via `firebase_vertexai`
- Streaming responses for fluid interaction
- Continuous conversation history
- Context preservation across messages
- Smooth input field with visual feedback
- Typing indicator while the Meow is “thinking”
- Raw visual logs for AI debugging

---

## 🧱 Architecture Overview

```
lib/
├── firebase_options.dart
├── main.dart
├── models/
│   └── message.dart
├── providers/
│   ├── chat_state_notifier.dart
│   ├── chat_state_provider.dart
│   ├── gemini.dart
│   ├── system_prompt.dart
├── services/
│   └── gemini_chat_service.dart
├── ui/
│   ├── screens/
│   │   ├── main_screen.dart
│   │   └── meow_status_screen.dart
│   ├── widgets/
│   │   └── chat/
│   │       ├── chat_input.dart
│   │       ├── message_bubble.dart
│   │       └── messages_list.dart
```

---

## 🚀 Tech Stack

- **Framework**: Flutter + Dart
- **AI**: Gemini via `firebase_vertexai`
- **State Management**: Riverpod
- **UUIDs**: `uuid` package
- **Firebase Integration**: FlutterFire CLI
- **Responsive UI**: Mobile-first layout

---

## 📱 Platform Support

- Android ✅
- iOS ✅
- Web (experimental) 🚧

---

## 🛠️ Local Setup on macOS (Android)

### Prerequisites

- Flutter SDK installed: https://docs.flutter.dev/get-started/install/macos
- Xcode installed (for CocoaPods and iOS support)
- Android Studio installed
- Android Emulator configured (e.g. Pixel 5, API 34)
- Dart and Flutter plugins enabled in your IDE
- Firebase project with Gemini API enabled
- `google-services.json` correctly placed in `android/app`

### Step-by-step

```bash
# 1. Clone the repository
git clone git@github.com:aludmila-gdev/meow_status.git
cd meow_status

# 2. Install dependencies
flutter pub get

# 3. Generate necessary files
dart run build_runner build --delete-conflicting-outputs

# 4. Launch Android emulator (or open it via Android Studio)
flutter emulators --launch emulator-5554

# 5. Run the app on the emulator
flutter run -d emulator-5554
```

> 💡 Tip: You can also run `flutter doctor` to validate your setup and get suggestions.

---

## 📊 Development Commands

```bash
# Format code
dart format lib test

# Static analysis
flutter analyze

# Run tests
flutter test

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 💬 How It Works

1. User types a sentence like *"I'm feeling peaceful today"*
2. The message is sent to Gemini via streaming API
3. Gemini replies with an emotional or supportive response
4. Messages are shown in real-time as they're streamed
5. The conversation history is preserved

---

## 🤝 Contributing

We welcome all feline-friendly contributions! Here's how to get started:

### 🔀 Branch Naming Convention

- `feature/<name>` — new features
- `bugfix/<name>` — fixes for bugs
- `chore/<name>` — minor updates and maintenance
- `test/<name>` — for test-related changes
- `refactor/<name>` — for code structure changes

### 💬 Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) pattern:

```
feat: add new cat animation on response
fix: correct overflow on chat bubble
test: add widget test for ChatInput
```

### 🔧 Pull Requests

- Keep PRs focused and small
- Always link to the related issue (if applicable)
- Add screenshots or GIFs for UI changes
- Ensure all tests are passing (`flutter test`)
- Run code coverage locally (`flutter test --coverage`)

### ✅ CI/CD Pipelines

The app uses GitHub Actions for:

- Running tests on pull requests
- Collecting coverage reports
- Sending diffs to Gemini for AI-assisted code reviews

Pipeline will fail if tests fail or coverage is broken — keep it green! 💚

---

Made with ❤️ by humans (and cats).
