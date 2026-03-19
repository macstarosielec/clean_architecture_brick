import 'package:{{project_name.snakeCase()}}/core/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

export 'package:{{project_name.snakeCase()}}/core/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get translation => AppLocalizations.of(this);
}
