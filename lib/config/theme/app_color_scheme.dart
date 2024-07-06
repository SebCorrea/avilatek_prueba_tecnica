import 'package:flutter/material.dart';

import 'app_colors.dart';

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
        onSecondaryContainer: AppColors.violet950,
        errorContainer: AppColors.red200,
        error: AppColors.red600,
        onError: AppColors.red900,
        background: AppColors.white100,
        onBackground: AppColors.black950,
        surface: AppColors.white50,
        onSurface: AppColors.black800,
        outline: AppColors.white200,
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
        errorContainer: AppColors.red200,
        error: AppColors.red600,
        onError: AppColors.red900,
        background: AppColors.black950,
        onBackground: AppColors.white100,
        surface: AppColors.black800,
        onSurface: AppColors.white50,
        outline: AppColors.black700,
      );
}
