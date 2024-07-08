import 'package:avilatek_prueba_tecnica/core/ui/utils/custom_icons.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String label;
  final IconData unSelectedIcon;
  final IconData selectedIcon;

  MenuItem({
    required this.label,
    required this.unSelectedIcon,
    required this.selectedIcon,
  });
}

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
