import 'package:avilatek_prueba_tecnica/config/routes/routes.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/injection_service.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/circular_gradient_icon_button.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/full_screen_error.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/full_screen_loader.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/ui/utils/ui_strings.dart';
import '../../../../core/ui/widgets/basic_appbar.dart';
import '../../domain/entities/movie.dart';
import '../blocs/popular_movies_bloc/popular_movies_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PopularMoviesBloc>()..add(GetPopularMovies()),
      child: Scaffold(
        appBar: BasicAppBar(
          leading: CircularGradientIconButton(
            iconData: Icons.menu,
            onClick: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: UIStrings.home,
          actions: [
            CircularGradientIconButton(
              backgroundColors: [
                context.colorScheme.surface,
                context.colorScheme.surface,
              ],
              iconData: Icons.search,
              onClick: () => context.push(AppRoutes.search)
            ),
            const SizedBox(width: 8.0)
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.0),
          child: _HomeView(),
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final popularMoviesBlocState = context.watch<PopularMoviesBloc>().state;

    if (popularMoviesBlocState.isError) {
      return FullScreenError(
        errorMessage: popularMoviesBlocState.errorTitle!,
        errorDescription: popularMoviesBlocState.errorDescription!,
      );
    }

    if (popularMoviesBlocState.isLoading) return const FullScreenLoader();

    return Column(
      children: [
        const SizedBox(height: 24),
        Expanded(
          child: MovieMasonry(
            movies: popularMoviesBlocState.movies,
            loadNextPage: () => context.read<PopularMoviesBloc>().add(LoadNextPage()),
            onClickMovie: (Movie movie) => context.push('${AppRoutes.movies}/${movie.id}'),
          ),
        ),
      ],
    );
  }
}
