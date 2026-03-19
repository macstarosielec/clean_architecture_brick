import 'package:{{project_name.snakeCase()}}/core/injectable/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String environment) async =>
    getIt.init(environment: environment);
