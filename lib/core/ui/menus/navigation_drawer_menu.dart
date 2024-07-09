import 'package:avilatek_prueba_tecnica/config/theme/app_colors.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/menus/menu_items.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/img_paths.dart';

class NavigationDrawerMenu extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<MenuItem> menuItems;

  const NavigationDrawerMenu({
    super.key,
    required this.navigationShell,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _NavigationDrawerHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _Options(
                navigationShell: navigationShell,
                menuItems: menuItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Options extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<MenuItem> menuItems;

  const _Options({required this.navigationShell, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = menuItems[index];
        return _MenuItem(
          navigationShell: navigationShell,
          showDivider: index == menuItems.length - 1,
          menuItem: menuItem,
          index: index,
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final MenuItem menuItem;
  final StatefulNavigationShell navigationShell;
  final bool showDivider;
  final int index;

  const _MenuItem({
    required this.navigationShell,
    required this.showDivider,
    required this.menuItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isSelectedItem = navigationShell.currentIndex == index;
    return Column(
      children: [
        if (showDivider)
          Divider(
            thickness: 1,
            color: context.colorScheme.outline,
          ),
        Container(
          decoration: BoxDecoration(
            color: isSelectedItem ? context.colorScheme.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  menuItem.label,
                  style: context.textTheme.titleMedium,
                ),
                leading: Icon(isSelectedItem ? menuItem.selectedIcon : menuItem.unSelectedIcon),
                onTap: () {
                  navigationShell.goBranch(index);
                  context.pop();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _NavigationDrawerHeader extends StatelessWidget {
  const _NavigationDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.violet950,
            Colors.black,
          ],
          stops: [0.4, 1],
        ),
      ),
      child: const _UserItem(),
    );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
          bottom: false,
          child: _UserImage(),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          UIStrings.name,
          style: context.textTheme.titleLarge!.copyWith(color: AppColors.white100),
        ),
        Text(
          UIStrings.email,
          style: context.textTheme.titleSmall!.copyWith(color: AppColors.white200),
        ),
      ],
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      height: 80,
      child: ClipOval(
        child: Image(
          image: AssetImage(ImgPaths.userImg),
        ),
      ),
    );
  }
}
