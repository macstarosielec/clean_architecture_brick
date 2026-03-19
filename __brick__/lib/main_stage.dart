{{#include_stage}}
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';

const _stage = 'stage';

Future<void> main() => bootstrap(environment: _stage);
{{/include_stage}}
