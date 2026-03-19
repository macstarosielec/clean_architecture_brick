import 'package:{{project_name.snakeCase()}}/repositories/crashlytics_repository.dart';
import 'package:{{project_name.snakeCase()}}/services/crashlytics/error_tracker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CrashlyticsRepository)
class DefaultCrashlyticsRepository implements CrashlyticsRepository {
  DefaultCrashlyticsRepository({
    required this.trackers,
  });

  final List<ErrorTracker> trackers;

  @override
  Future<void> trackFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackFatal(
        exception: exception,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> trackNonFatal({
    required Object exception,
    StackTrace? stackTrace,
  }) async {
    for (final tracker in trackers) {
      await tracker.trackNonFatal(
        exception: exception,
        stackTrace: stackTrace,
      );
    }
  }
}
