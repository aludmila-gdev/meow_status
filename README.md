# 🐱 Meow Status

Meow Status is a fun Flutter-based application that displays a random cat image and quote based on the HTTP status code you provide. Perfect for developers who want to debug with a dose of cuteness.

---

## 🚀 Project Overview

- **Platform**: Flutter (Android, iOS, Web, Desktop)
- **Architecture**: Feature-first, Clean Code
- **Language**: Dart
- **Use case**: Fun + educational tool to visualize HTTP status codes via cat images

---

## 🧱 Folder Structure

```bash
.
├── android/                 # Android native files
├── ios/                     # iOS native files
├── lib/                     # Flutter/Dart core logic
│   └── features/status      # Main feature: status → image + quote
├── web/                     # Web-related assets
├── test/                    # Unit and widget tests
├── macos/, linux/, windows/ # Desktop platform-specific files
├── .github/workflows/       # CI config using GitHub Actions
└── docs/                    # TechDocs (Backstage) documentation
```

---

## 📦 Features

- ✅ Fetch random cat images
- ✅ Display inspirational (or sarcastic) cat quotes
- ✅ Handles HTTP status codes visually
- 🧪 Unit and widget tests (WIP)
- 🧰 CI with GitHub Actions (`flutter_ci.yml`)

---

## 🛠 How to Run Locally

### ▶️ Common Setup

```bash
flutter pub get
```

### 📱 Android

```bash
flutter emulators --launch <emulator_id>  # Optional: start emulator
flutter run -d android
```

> Ensure you have an Android emulator or physical device connected.

### 🍏 iOS

```bash
open ios/Runner.xcworkspace  # Open in Xcode
# In Xcode, set up signing and select a valid team
flutter run -d ios
```

> Make sure you have Xcode and CocoaPods installed.

### 🌐 Web

```bash
flutter run -d chrome
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📈 CI/CD

This project includes a basic GitHub Actions setup for Flutter.  
Workflow path: `.github/workflows/flutter_ci.yml`

---

## 👩‍💻 Contributing

To help improve Meow Status:

1. Fork this repo
2. Create a new branch (`feature/my-feature`)
3. Commit your changes with clear messages
4. Push and open a PR

Don't forget to run `flutter format .` before committing!

---

## 📚 Related Docs

- [Status Codes for Humans](https://http.cat/)
- [Flutter Documentation](https://flutter.dev/docs)

---

## 💬 Contact

For questions or suggestions, ping the project maintainer on Slack or GitHub.

Happy Coding and... Meow! 🐾
