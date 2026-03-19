import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/config/app_constants.dart';
import 'package:{{project_name.snakeCase()}}/core/config/prod/firebase_options_prod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@prod
@Injectable(as: IAppConfig)
class AppConfigProd implements IAppConfig {
  @override
  String? get appName => AppConstants.appNameProd;

  @override
  String? get environment => 'prod';

  @override
  bool get isLogBlocChanges => false;

  @override
  bool get isLogBlocErrors => false;

  @override
  FirebaseOptions? getFirebaseOptions() =>
      DefaultFirebaseOptions.currentPlatform;
}
