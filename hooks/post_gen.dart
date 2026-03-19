import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final includeStage = context.vars['include_stage'] as bool? ?? true;

  if (!includeStage) {
    final filesToDelete = [
      'lib/main_stage.dart',
      'lib/core/config/stage/app_config_stage.dart',
      'lib/core/config/stage/firebase_options_stage.dart',
    ];

    for (final path in filesToDelete) {
      final file = File(path);
      if (file.existsSync()) {
        file.deleteSync();
        context.logger.info('Deleted $path (stage not included)');
      }
    }

    // Clean up empty stage directory
    final stageDir = Directory('lib/core/config/stage');
    if (stageDir.existsSync() && stageDir.listSync().isEmpty) {
      stageDir.deleteSync();
    }
  }

  // Make flutterfire-config.sh executable
  final configScript = File('flutterfire-config.sh');
  if (configScript.existsSync()) {
    await Process.run('chmod', ['+x', 'flutterfire-config.sh']);
    context.logger.info('Made flutterfire-config.sh executable');
  }
}
