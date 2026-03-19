import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/services/crashlytics/error_tracker.dart';
import 'package:{{project_name.snakeCase()}}/services/crashlytics/trackers/firebase_error_tracker.dart';
import 'package:{{project_name.snakeCase()}}/services/crashlytics/trackers/std_out_error_tracker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CrashlyticsModule {
  FirebaseCrashlytics getFirebaseCrashlytics() =>
      FirebaseCrashlytics.instance;

  List<ErrorTracker> getErrorTrackers(
    IAppConfig appConfig,
    FirebaseErrorTracker firebaseErrorTracker,
    StdOutErrorTracker stdOutErrorTracker,
  ) {
    final trackers = <ErrorTracker>[
      firebaseErrorTracker,
    ];

    if (appConfig.environment != 'prod') {
      trackers.add(stdOutErrorTracker);
    }
    return trackers;
  }
}
