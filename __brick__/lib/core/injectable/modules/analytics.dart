import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/services/analytics/analytics_tracker.dart';
import 'package:{{project_name.snakeCase()}}/services/analytics/trackers/firebase_analytics_tracker.dart';
import 'package:{{project_name.snakeCase()}}/services/analytics/trackers/std_out_analytics_tracker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AnalyticsModule {
  FirebaseAnalytics getFirebaseAnalytics() => FirebaseAnalytics.instance;

  List<AnalyticsTracker> getAnalyticsTrackers(
    IAppConfig appConfig,
    FirebaseAnalyticsTracker firebaseAnalyticsTracker,
    StdOutAnalyticsTracker stdOutAnalyticsTracker,
  ) {
    final trackers = <AnalyticsTracker>[
      firebaseAnalyticsTracker,
    ];

    if (appConfig.environment != 'prod') {
      trackers.add(stdOutAnalyticsTracker);
    }
    return trackers;
  }
}
