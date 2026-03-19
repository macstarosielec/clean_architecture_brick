import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class GenericModule {
  @lazySingleton
  Logger getLogger() => Logger();
}
