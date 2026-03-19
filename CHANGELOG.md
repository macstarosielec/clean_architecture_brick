# Changelog

## 2.0.0

- Replaced `EnvironmentConfig` with `IAppConfig` interface + Injectable per-env implementations
- Added analytics/crashlytics service layer with tracker/repository pattern
- Added localization (l10n) scaffolding with ARB files and BuildContext extension
- Added FlutterGen for type-safe assets and colors
- Added light/dark theme support
- Added AutoRoute v10 with route observer
- Added sample home feature module
- Added test infrastructure (pump_app helper, mocktail, bloc_test)
- Added flutterfire-config.sh template script
- Added .gitignore template
- Added Mason hooks for conditional stage file cleanup
- Updated all package versions (flutter_bloc 9.x, auto_route 10.x, freezed 3.x, VGA 7.x)
- Removed dartz and equatable dependencies
- Moved from flat presentation/data/domain dirs to feature-based structure

## 1.0.0

- Initial release
- Layer-based Clean Architecture structure
- Firebase Crashlytics and Analytics integration
- Multiple environment support (dev, prod, stage)
- GetIt + Injectable for DI
- Dio + Retrofit for networking
- BLoC for state management
- Freezed for immutable models
- AutoRoute for navigation
- Very Good Analysis linting
