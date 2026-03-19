{{#include_stage}}
import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/config/app_constants.dart';
import 'package:{{project_name.snakeCase()}}/core/config/stage/firebase_options_stage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

const stage = Environment('stage');

@stage
@Injectable(as: IAppConfig)
class AppConfigStage implements IAppConfig {
  @override
  String? get appName => AppConstants.appNameStage;

  @override
  String? get environment => 'stage';

  @override
  bool get isLogBlocChanges => false;

  @override
  bool get isLogBlocErrors => true;

  @override
  FirebaseOptions? getFirebaseOptions() =>
      DefaultFirebaseOptions.currentPlatform;
}
{{/include_stage}}
