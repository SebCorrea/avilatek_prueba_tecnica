import 'package:avilatek_prueba_tecnica/config/routes/routes.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/menus/navigation_drawer_scaffold.dart';
import '../../features/configuration/ui/screens/configuration_screen.dart';
import '../../features/favorite_movies/ui/screens/favorite_movies_screen.dart';
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
              path: AppRoutes.series,
              builder: (context, state) => const FavoriteMoviesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.series,
              builder: (context, state) => const FavoriteMoviesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.configuration,
              builder: (context, state) =>  const ConfigurationScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
