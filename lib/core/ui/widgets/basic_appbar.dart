import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;

  const BasicAppBar({super.key, this.leading, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.background,
      title: Text(
        title ?? '',
        style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: leading,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
