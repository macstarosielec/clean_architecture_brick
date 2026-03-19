import 'package:firebase_core/firebase_core.dart';

abstract class IAppConfig {
  String? get environment;
  String? get appName;
  bool get isLogBlocChanges;
  bool get isLogBlocErrors;
  FirebaseOptions? getFirebaseOptions();
}
