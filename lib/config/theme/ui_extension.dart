import 'package:flutter/material.dart';


/// Extensión en `BuildContext` para proporcionar acceso conveniente a propiedades del tema y tamaño de pantalla.
///
/// Esta extensión agrega las siguientespropiedades a `BuildContext`:
///
extension UIExtension on BuildContext {

  /// * `textTheme`: Proporciona acceso al objeto `TextTheme` del tema actual.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// * `colorScheme`: Proporciona acceso al objeto `ColorScheme` del tema actual.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// * `screenSize`: Proporciona acceso al tamaño de la pantalla a través de`MediaQuery`.
  Size get screenSize => MediaQuery.of(this).size;
}
