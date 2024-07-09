import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class CircularGradientIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onClick;
  final List<Color> backgroundColors;
  final double size;
  final Color? iconColor;

  const CircularGradientIconButton({
    super.key,
    required this.iconData,
    required this.onClick,
    this.backgroundColors = const [AppColors.violet500, AppColors.indigo500],
    this.size = 40,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: backgroundColors),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onClick,
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        icon: Icon(
          iconData,
          size: size / 2,
          color: iconColor ?? context.colorScheme.onSurface,
        ),
      ),
    );
  }
}
