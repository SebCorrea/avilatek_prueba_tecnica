import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';
/// AppBar básico de la aplicación
/// [leading] Widget que se mostrará en la parte izquierda del Appbar
/// [title] Texto utilizado como título del appbar
/// [actions] Widgets que se mostrarán en la parte derecha del Appbar
class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;

  const BasicAppBar({super.key, this.leading, this.title, this.actions});

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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: leading,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
