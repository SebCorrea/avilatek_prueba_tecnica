import 'package:avilatek_prueba_tecnica/core/ui/utils/custom_icons.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:flutter/material.dart';

/// Representa un elemento del menú con su etiqueta, icono seleccionado e icono no seleccionado.
class MenuItem {
  /// La etiqueta del elementodel menú.
  final String label;
  /// El icono que se mostrará cuando el elemento del menú no esté seleccionado.
  final IconData unSelectedIcon;
  /// El icono que se mostrará cuando el elemento del menú esté seleccionado.
  final IconData selectedIcon;

  MenuItem({
    required this.label,
    required this.unSelectedIcon,
    required this.selectedIcon,
  });
}

/// Lista de elementos del menú de la aplicación.
final List<MenuItem> menuItems = [
  MenuItem(
    label: UIStrings.home,
    unSelectedIcon: CustomIcons.icOutlinedHome,
    selectedIcon: CustomIcons.icFilledHome,
  ),
  MenuItem(
    label: UIStrings.topRated,
    unSelectedIcon: Icons.star_border,
    selectedIcon: Icons.star,
  ),
  MenuItem(
    label: UIStrings.configuration,
    unSelectedIcon: Icons.settings,
    selectedIcon: Icons.settings,
  )
];
