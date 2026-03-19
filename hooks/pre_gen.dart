import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final includeStage = context.vars['include_stage'] as bool? ?? true;

  if (includeStage) {
    final baseUrlStage = context.logger.prompt(
      'What is the staging API URL?',
      defaultValue: 'https://stage-api.example.com',
    );
    context.vars['base_url_stage'] = baseUrlStage;
  } else {
    context.vars['base_url_stage'] = '';
  }
}
