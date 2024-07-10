import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

/// Una página de transición personalizada que utiliza [FadeTransition] para animar la transición entre páginas.
///
/// [child] es la página que se animará.
///
/// [transitionDuration] es la duración de laanimación.
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
/// Una página de transición personalizada que utiliza [SlideTransition] para animar la transición entre páginas.
///
/// [child] es la página que se animará.
///
/// [transitionDuration] es la duración de laanimación.
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
