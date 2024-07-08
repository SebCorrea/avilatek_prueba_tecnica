import 'dart:math';

import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/cupertino.dart';

class CustomLoader extends StatefulWidget {
  final double size;

  const CustomLoader({super.key, this.size = 70});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _sizeAnimation = Tween(
      begin: 10.0,
      end: widget.size,
    ).animate(_controller);

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: SizedBox(
            height: _sizeAnimation.value,
            width: _sizeAnimation.value,
            child: child!,
          ),
        );
      },
      child: CustomPaint(
        painter: MakeCircle(color: context.colorScheme.primary),
      ),
    );
  }
}

class MakeCircle extends CustomPainter {
  final Color color;

  const MakeCircle({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(width / 2, height / 2);
    final radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
