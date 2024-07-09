import 'package:flutter/cupertino.dart';

class CustomFadeTransition extends PageRouteBuilder {
  final Widget child;

  CustomFadeTransition({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
