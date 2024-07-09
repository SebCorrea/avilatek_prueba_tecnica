import 'package:avilatek_prueba_tecnica/config/routes/routes.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/screens/movie_details_screen.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/screens/top_rated_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/menus/navigation_drawer_scaffold.dart';
import '../../features/actor_details/ui/screens/actor_details_screen.dart';
import '../../features/configuration/ui/screens/configuration_screen.dart';
import '../../features/movies/ui/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationDrawerScaffold(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.topRated,
              builder: (context, state) => const TopRatedMoviesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.configuration,
              builder: (context, state) => const ConfigurationScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '${AppRoutes.movies}/:id',
      pageBuilder: (context, state) =>
          buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: MovieDetailsScreen(
              movieId: int.parse(state.pathParameters['id'] ?? '-1'),
            ),
          ),

    ),
    GoRoute(
      path: '${AppRoutes.actor}/:id',
      builder: (context, state) => ActorDetailsScreen(
        actorId: int.parse(state.pathParameters['id'] ?? '-1'),
      ),
    ),
  ],
);



CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}