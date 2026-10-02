# MPSC Katta

A professional Marathi MPSC preparation app built with Flutter for iOS and Android.

## Features
- Marathi-first interface
- Subject-wise practice dashboard
- Mock test flow
- Progress tracking UI
- Ready for question bank expansion

## Tech stack
- Flutter
- Dart
- Material 3

## Run locally

```bash
flutter pub get
flutter run
```

## Project structure
- `lib/main.dart` – app entry point
- `lib/models/question.dart` – question model
- `lib/data/mock_questions.dart` – sample MPSC question bank
- `lib/screens/` – app screens
- `lib/widgets/` – reusable UI components

## Notes
This starter app includes a structured question model and sample Marathi MPSC data. For a production app with 15,000–20,000 questions, the recommended approach is to load data from JSON, SQLite, or Firebase Firestore in batches by subject and chapter.
