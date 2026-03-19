import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/config/app_constants.dart';
import 'package:{{project_name.snakeCase()}}/core/config/dev/firebase_options_dev.dart';
import 'package:{{project_name.snakeCase()}}/core/constants/api_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@dev
@Injectable(as: IAppConfig)
class AppConfigDev implements IAppConfig {
  @override
  String? get appName => AppConstants.appNameDev;

  @override
  String? get environment => 'dev';

  @override
  String get baseUrl => ApiConstants.baseUrlDev;

  @override
  bool get isLogBlocChanges => false;

  @override
  bool get isLogBlocErrors => true;

  @override
  FirebaseOptions? getFirebaseOptions() =>
      DefaultFirebaseOptions.currentPlatform;
}
