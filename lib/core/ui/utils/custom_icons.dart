import 'package:flutter/widgets.dart';

/// Clase que define iconos personalizados para la aplicación.
class CustomIcons {
  CustomIcons._();

  /// Nombre de la familia de fuentes para los iconos personalizados.
  static const _kFontFam = 'MenuIcons';
  /// Paquete de fuentes para los iconos personalizados (nulo si no se utiliza un paquete).
  static const String? _kFontPkg = null;

  static const IconData icOutlinedSeries = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icOutlinedHome = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icOutlinedMovie = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icFilledMovie = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icFilledSeries = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icFilledHome = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
