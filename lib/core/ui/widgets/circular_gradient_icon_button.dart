import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

/// Un botón circular con un icono y un degradado de fondo.
///
/// [iconData] Icono que mostrará el botón
///
/// [onClick] Función que se ejecuta al presionar el botón
///
/// [backgroundColors] Array de colores para general el degradado Si no se especifica toma [AppColors.indigo500] y [AppColors.violet500],
///
/// [size] Tamaño del botón. Si no se especifica toma un tamaño de 40
///
/// [iconColor] El color del icono. Si no se especifica, se utilizará el color [onSurface] del tema actual.
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
    this.backgroundColors = const [AppColors.indigo500, AppColors.violet500],
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
