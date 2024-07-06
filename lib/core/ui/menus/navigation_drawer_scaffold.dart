import 'package:avilatek_prueba_tecnica/core/ui/menus/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_drawer_menu.dart';

class NavigationDrawerScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationDrawerScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerMenu(
        navigationShell: navigationShell,
        menuItems: menuItems,
      ),
      body: navigationShell,
    );
  }
}
