import 'package:avilatek_prueba_tecnica/config/theme/app_color_scheme.dart';
import 'package:avilatek_prueba_tecnica/config/theme/app_text_theme.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

/// Clase abstracta que define la interfaz para los temas de la aplicación.
///
/// Esta clase proporciona un método abstracto `build()` que debe ser implementado
/// por las clases concretas de temas para construir un objeto `ThemeData`.
abstract class AppTheme {
  const AppTheme();

  /// Construye un objeto `ThemeData` para el tema.
  ///
  /// [context] El contextode compilación.
  ThemeData build(BuildContext context);
}

/// Tema claro de la aplicación.
///
/// Implementa la interfaz `AppTheme` y construye un objeto `ThemeData` con
/// el esquema de color claro, el tema de texto claro y el tema de iconos claro.
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

/// Tema oscuro de la aplicación.
///
/// Implementa la interfaz `AppTheme` y construye un objeto `ThemeData` con
/// el esquema de color oscuro, el tema de texto oscuro y el tema de iconos oscuro.
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
