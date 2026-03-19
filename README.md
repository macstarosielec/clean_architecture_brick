# Clean Architecture Layer Brick

A Mason brick for generating a production-ready Flutter project with Clean Architecture (layer-based).

## Features

- Layer-based Clean Architecture structure with feature modules
- Firebase Crashlytics and Analytics with abstracted service layer
- Multiple environment support (dev, prod, stage) via Injectable
- BLoC for state management with configurable observer
- GetIt + Injectable for dependency injection
- Dio + Retrofit for networking
- Freezed for immutable models and sealed classes
- AutoRoute v10 for navigation with route observer
- FlutterGen for type-safe assets and colors
- Localization (l10n) with ARB files and BuildContext extension
- Light/Dark theme support
- Very Good Analysis for linting
- Test infrastructure with pump_app helper
- FlutterFire CLI config script for per-environment Firebase setup

## Installation

### Global Installation

```bash
mason add -g clean_architecture_layer --git-url https://github.com/macstarosielec/clean_architecture_brick.git
```

### Project Installation

```bash
mason add clean_architecture_layer --git-url https://github.com/macstarosielec/clean_architecture_brick.git
```

## Usage

```bash
mason make clean_architecture_layer
```

You'll be prompted for:
- Project name
- Development API URL
- Production API URL
- Whether to include staging environment
- Staging API URL (if included)

## Generated Structure

```
lib/
├── app/
│   ├── app.dart                    # App + AppView widgets
│   └── app_bloc_observer.dart      # BLoC observer with DI
├── bootstrap.dart                  # App initialization
├── main_dev.dart                   # Dev entry point
├── main_prod.dart                  # Prod entry point
├── main_stage.dart                 # Stage entry point (optional)
├── core/
│   ├── config/
│   │   ├── app_config.dart         # IAppConfig interface
│   │   ├── app_constants.dart      # Per-env app names
│   │   ├── dev/                    # Dev config + Firebase options
│   │   ├── prod/                   # Prod config + Firebase options
│   │   └── stage/                  # Stage config (optional)
│   ├── constants/
│   │   └── api_constants.dart      # API URLs and timeouts
│   ├── error/
│   │   ├── exceptions.dart         # Custom exceptions
│   │   └── failures.dart           # Freezed failure types
│   ├── extensions/
│   │   └── build_context_x.dart    # Localization extension
│   ├── injectable/
│   │   ├── injectable.dart         # GetIt + configureDependencies
│   │   └── modules/
│   │       ├── generic.dart        # Logger module
│   │       ├── analytics.dart      # Analytics DI module
│   │       └── crashlytics.dart    # Crashlytics DI module
│   ├── l10n/
│   │   └── arb/
│   │       └── app_en.arb          # English translations
│   ├── network/
│   │   ├── dio_client.dart         # Dio configuration
│   │   └── network_info.dart       # Connectivity checker
│   ├── routes/
│   │   ├── router.dart             # AutoRoute config
│   │   └── route_observer.dart     # Navigation observer
│   └── utils/
│       ├── extensions.dart         # String/DateTime extensions
│       └── validators.dart         # Form validators
├── features/
│   └── home/                       # Sample feature module
│       ├── home.dart
│       └── view/
│           ├── home_page.dart
│           └── view.dart
├── repositories/
│   ├── analytics_repository.dart
│   ├── analytics/
│   │   └── default_analytics_repository.dart
│   ├── crashlytics_repository.dart
│   └── crashlytics/
│       └── default_crashlytics_repository.dart
├── services/
│   ├── analytics/
│   │   ├── analytics_tracker.dart
│   │   ├── custom_events/
│   │   │   └── firebase_custom_events.dart
│   │   └── trackers/
│   │       ├── firebase_analytics_tracker.dart
│   │       └── std_out_analytics_tracker.dart
│   └── crashlytics/
│       ├── error_tracker.dart
│       └── trackers/
│           ├── firebase_error_tracker.dart
│           └── std_out_error_tracker.dart
└── theme/
    └── theme.dart                  # Light/Dark themes

assets/
├── color/
│   └── colors.xml                  # FlutterGen color definitions
└── images/

test/
├── pump_app.dart                   # Widget test helper
└── app/
    └── app_test.dart               # App test skeleton
```

## After Generation

### 1. Get Dependencies

```bash
flutter pub get
```

### 2. Configure Firebase

Install FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

Generate Firebase config for each environment:
```bash
chmod +x flutterfire-config.sh
./flutterfire-config.sh dev
./flutterfire-config.sh prod
```

### 3. Generate Code

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Generate Localizations

```bash
flutter gen-l10n
```

### 5. Run the App

**Development:**
```bash
flutter run -t lib/main_dev.dart
```

**Production:**
```bash
flutter run -t lib/main_prod.dart
```

## Architecture

### Environment Configuration

Each environment (dev/prod/stage) has its own `IAppConfig` implementation registered with Injectable's `@dev`/`@prod` annotations. Firebase options, app name, and logging flags are encapsulated per environment.

### Analytics & Crashlytics

The brick uses a tracker/repository pattern:
- **Trackers**: `FirebaseAnalyticsTracker`, `StdOutAnalyticsTracker`, `FirebaseErrorTracker`, `StdOutErrorTracker`
- **Repositories**: `AnalyticsRepository`, `CrashlyticsRepository` fan out to multiple trackers
- **DI Modules**: Automatically add stdout trackers in dev mode for console logging

### Feature Modules

Each feature follows the pattern:
```
features/
└── feature_name/
    ├── feature_name.dart    # Barrel export
    ├── view/
    │   ├── feature_page.dart
    │   └── view.dart
    ├── bloc/                # Feature BLoC
    └── widgets/             # Feature widgets
```

## License

MIT License - see LICENSE file for details
