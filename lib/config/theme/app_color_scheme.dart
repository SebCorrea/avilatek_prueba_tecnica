import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Clase que define los esquemas de color de la aplicación para los modos claro y oscuro.
///
/// Proporciona dos esquemas decolor predefinidos:
/// * `light()`: Esquema de color para el modo claro.
/// * `dark()`: Esquema de color para el modo oscuro.
///
/// Cada esquema de color define una paleta de colores que se utilizan en toda la aplicación
/// para garantizar una apariencia consistentey armoniosa.
class AppColorScheme {
  static ColorScheme light() => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.indigo500,
        onPrimary: AppColors.white100,
        primaryContainer: AppColors.indigo200,
        onPrimaryContainer: AppColors.indigo950,
        secondary: AppColors.violet500,
        onSecondary: AppColors.white100,
        secondaryContainer: AppColors.violet300,
        onSecondaryContainer: AppColors.indigo200,
        errorContainer: AppColors.red200,
        error: AppColors.red600,
        onError: AppColors.red900,
        onErrorContainer: AppColors.red950,
        background: AppColors.white100,
        onBackground: AppColors.black950,
        surface: AppColors.white50,
        onSurface: AppColors.black800,
        outline: AppColors.white200,
        outlineVariant: AppColors.gray400,
      );

  static ColorScheme dark() => const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.indigo500,
        onPrimary: AppColors.black950,
        primaryContainer: AppColors.indigo200,
        onPrimaryContainer: AppColors.indigo950,
        secondary: AppColors.violet500,
        onSecondary: AppColors.black950,
        secondaryContainer: AppColors.violet300,
        onSecondaryContainer: AppColors.violet950,
        errorContainer: AppColors.red950,
        error: AppColors.red800,
        onError: AppColors.white50,
        onErrorContainer: AppColors.white50,
        background: AppColors.black950,
        onBackground: AppColors.white100,
        surface: AppColors.black800,
        onSurface: AppColors.white50,
        outline: AppColors.black700,
        outlineVariant: AppColors.gray400,
      );
}
