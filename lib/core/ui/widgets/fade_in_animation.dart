import 'package:flutter/material.dart';

/// Un widget que anima la opacidad de su hijo de 0 a 1 durante una duración especificada.
/// [duration] La duración de la animación. En caso de no especificarse toma un valor de 500 milisegundos
class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
