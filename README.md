# Elden Nexus

A lightweight, polished Flutter application for Elden Ring players to browse, save and manage weapons, armors, spells, ashes, talismans and item sets. Designed for desktop and mobile, the project demonstrates modular Flutter architecture, localization, theme support, and optional Firebase integration for auth and remote DB.

## Key Highlights
- Browse a large curated catalog of weapons, armors, spells and accessories with images and metadata.
- Localized UI with multiple language files under `lib/locale/`.
- Themed interface and responsive layouts (desktop + mobile).
- Firebase integration points for authentication and database sync (optional).
- Developer utilities and fixtures for seeding sample data.

## Features
- Complete item models: weapons, armors, armor sets, sorceries, incantations, tears, talismans.
- Item detail views with images, requirements and stats.
- Settings and profile UIs with language and password components under `lib/components/settings/`.
- Local image assets and custom fonts packaged in the repository.
- Optional Firebase auth and DB helpers in `lib/firebase/`.

## Demonstration
\@TODO: SCREENSHOTS of key views (home, item list, item detail, settings) to showcase UI and features.

## Tech Stack
- Flutter (stable)
- Dart
- Firebase (optional: `lib/firebase/auth` and `lib/firebase/database`)
- Android (Kotlin / Java) via Gradle
- Platform-aware code for desktop and mobile

## Prerequisites
- Flutter SDK (stable channel)
- For Windows desktop testing: enable desktop support
- Recommended editor: VS Code or Android Studio (Android Studio Narwhal FD | 2025.1.2 Patch 1)

## Quick Start

1. Clone the repo  
   git clone https://github.com/E-Rossignol/elden_nexus.git

2. Install dependencies  
   flutter pub get

3. Run (Windows)  
   flutter run -d windows

4. Run (Android)  
   flutter run

If you update native dependencies or run into build issues, try:
- `flutter clean`
- `flutter pub get`
- `flutter build apk` (or `flutter run`)

## Developer utilities (fixtures & helpers)
Helper utilities exist in `lib/constants/helper.dart` to hold fixtures and UI constants used for seeding example data. Firebase helper wrappers are available:

- `lib/firebase/auth/auth.dart` — authentication helpers and sign-in flows.
- `lib/firebase/database/database.dart` — DB helpers for reading/writing remote data (if configured).

Use these utilities to seed local sample data or integrate optional Firebase syncing for testing.

## Project Structure (important files)
- `lib/main.dart` — application entrypoint and routing.
- `lib/firebase_options.dart` — generated Firebase configuration (if used).
- `lib/constants/constant.dart` — large in-project constants and hard-coded item fixtures.
- `lib/constants/helper.dart` — helper functions and fixtures.
- `lib/firebase/auth/auth.dart` — Firebase auth helpers.
- `lib/firebase/database/database.dart` — Firebase DB helpers.
- `lib/locale/` — localization files (`en.dart`, `fr.dart`, etc.).
- `lib/theme/` — theme provider and theme definitions.
- `lib/components/` — reusable UI components and settings widgets.
- `lib/views/` — screens and pages (home, loading, items, settings).

Assets and resources are packaged under `lib/constants/fonts/`, `lib/constants/images/` and `lib/constants/icons/`.

## What this project demonstrates
- Flutter & Dart proficiency: modular widgets, responsive UI and localization.
- Asset management: packaged fonts, images and icons for a content-rich app.
- Optional Firebase integration: separation of auth and DB concerns.
- Clean project organization: constants, models, views and components separated for maintainability.
- Attention to UX: themed UI, settings and polished components.

## How to validate these skills quickly
- Run the app and browse the item lists; open item detail pages to verify models and assets load.
- Inspect `lib/constants/constant.dart` and `lib/constants/helper.dart` to review the data fixtures and constants.
- Review `lib/views/` and `lib/components/` to evaluate component design and layout patterns.
- If Firebase is configured, test sign-in flows in `lib/firebase/auth/auth.dart` and read/write via `lib/firebase/database/database.dart`.

## Contributing
- Open an issue for bugs or feature requests.
- Fork the repo, create a feature branch and send a PR with a clear description and screenshots.
- Keep formatting consistent (dartfmt) and add unit/UI tests when relevant.

## Contact
Erwan Rossignol — erwan@hotmail.ch  
Project repository: https://github.com/E-Rossignol/elden_nexus.git