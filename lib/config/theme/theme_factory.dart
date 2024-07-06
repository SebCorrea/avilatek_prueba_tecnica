import 'package:avilatek_prueba_tecnica/config/theme/app_color_scheme.dart';
import 'package:avilatek_prueba_tecnica/config/theme/app_text_theme.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme();

  ThemeData build(BuildContext context);
}

class LightTheme extends AppTheme {
  const LightTheme();

  @override
  ThemeData build(BuildContext context) {
    final colorScheme = AppColorScheme.light();
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: AppTextTheme(colorScheme.onBackground).textTheme(),
      iconTheme: IconThemeData(
        size: 20,
        color: context.colorScheme.primary,
      ),

    );
  }
}

class DarkTheme extends AppTheme {
  const DarkTheme();

  @override
  ThemeData build(BuildContext context) {
    final colorScheme = AppColorScheme.dark();
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: AppTextTheme(colorScheme.onBackground).textTheme(),
      iconTheme: IconThemeData(
        size: 20,
        color: context.colorScheme.primary,
      ),
    );
  }
}
