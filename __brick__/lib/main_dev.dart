import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:injectable/injectable.dart';

Future<void> main() => bootstrap(environment: Environment.dev);
