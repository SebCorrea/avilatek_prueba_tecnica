import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CustomFadeTransition extends CustomTransitionPage {
  CustomFadeTransition({
    required super.child,
    super.transitionDuration,
  }) : super(
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class CustomSlideTransition extends CustomTransitionPage {
  CustomSlideTransition({
    required super.child,
    super.transitionDuration,
  }) : super(
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
