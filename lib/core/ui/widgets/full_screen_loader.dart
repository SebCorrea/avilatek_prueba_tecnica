import 'package:flutter/material.dart';

import 'custom_loader.dart';

///Widget que muestra una animacion de carga a pantalla completa
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const CustomLoader(),
    );
  }
}


