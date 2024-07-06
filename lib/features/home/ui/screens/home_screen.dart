
import 'package:avilatek_prueba_tecnica/core/ui/utils/custom_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          CustomIcons.icOutlinedMovie,
          size: 24,
        ),
      ),
    );
  }
}
