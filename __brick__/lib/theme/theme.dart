import 'package:{{project_name.snakeCase()}}/core/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class {{project_name.pascalCase()}}Theme {
  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: ColorName.primaryColor,
        appBarTheme: const AppBarTheme(
          color: ColorName.primaryDarkColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: ColorName.secondaryColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      );

  static ThemeData get dark => ThemeData(
        scaffoldBackgroundColor: ColorName.primaryColor,
        appBarTheme: const AppBarTheme(
          color: ColorName.primaryDarkColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: ColorName.secondaryColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      );
}
