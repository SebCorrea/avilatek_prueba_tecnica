
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/ui_strings.dart';

/// AppBar con un campo de búsqueda que se anima para expandirse a lo ancho de la pantalla.
///
/// [screenWidth] El ancho de la pantalla
///
/// [onChanged] Función que se ejecuta cuando se ingresa texto
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double screenWidth;
  final void Function(String value) onChanged;

  const SearchAppBar({
    super.key,
    required this.screenWidth,
    required this.onChanged,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _initSearchTextFieldListeners();
    _initAnimations();
  }

  void _initAnimations() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _widthAnimation = Tween(begin: 80.0, end: widget.screenWidth).animate(_controller);
    _opacityAnimation = Tween(begin: 0.4, end: 1.0).animate(_controller);
  }

  void _initSearchTextFieldListeners() {
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AppBar(
      actions: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => context.pop(),
                child: Row(
                  children: [
                    Text(
                      UIStrings.cancelLabel,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ],
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Align(
        alignment: Alignment.centerRight,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            //Animate Opacity
            return Opacity(
              opacity: _opacityAnimation.value,
              //Animate Width
              child: SizedBox(
                width: _widthAnimation.value,
                child: child,
              ),
            );
          },
          child: SearchTextField(
            autofocus: false,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
          ),
        ),
      ),
      backgroundColor: context.colorScheme.background,
      surfaceTintColor: context.colorScheme.background,
    );
  }
}