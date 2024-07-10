import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/// Clase que define los estilos de texto de la aplicación.
///
/// El color de la fuente [fontColor] se puede personalizar a través del constructor.
class AppTextTheme {
  final Color fontColor;

  AppTextTheme(this.fontColor);

  TextStyle _buildFont({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    required double letterSpacing,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height / fontSize,
        letterSpacing: letterSpacing,
        color: fontColor,
      );

  TextTheme textTheme() => TextTheme(
        displayLarge: _buildFont(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          height: 64,
          letterSpacing: -0.25,
        ),
        displayMedium: _buildFont(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          height: 52,
          letterSpacing: 0,
        ),
        displaySmall: _buildFont(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          height: 44,
          letterSpacing: 0,
        ),
        headlineLarge: _buildFont(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 40,
          letterSpacing: 0,
        ),
        headlineMedium: _buildFont(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          height: 36,
          letterSpacing: 0,
        ),
        headlineSmall: _buildFont(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          height: 32,
          letterSpacing: 0,
        ),
        titleLarge: _buildFont(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 28,
          letterSpacing: 0,
        ),
        titleMedium: _buildFont(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 24,
          letterSpacing: 0.15,
        ),
        titleSmall: _buildFont(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20,
          letterSpacing: 0.1,
        ),
        bodyLarge: _buildFont(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24,
          letterSpacing: 0.5,
        ),
        bodyMedium: _buildFont(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20,
          letterSpacing: 0.25,
        ),
        bodySmall: _buildFont(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16,
          letterSpacing: 0.4,
        ),
        labelLarge: _buildFont(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20,
          letterSpacing: 0.1,
        ),
        labelMedium: _buildFont(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 16,
          letterSpacing: 0.5,
        ),
        labelSmall: _buildFont(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 16,
          letterSpacing: 0.5,
        ),
      );
}
