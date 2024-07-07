import 'package:avilatek_prueba_tecnica/core/services/get_it/injection_service.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/full_screen_loader.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/widgets/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/ui/utils/ui_strings.dart';
import '../../../../core/ui/widgets/basic_appbar.dart';
import '../blocs/get_popular_movies_bloc/get_popular_movies_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: UIStrings.home,
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: BlocProvider(
          create: (_) => getIt<GetPopularMoviesBloc>()..add(GetPopularMovies()),
          child: const _HomeView(),
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final popularMoviesBlocState = context.watch<GetPopularMoviesBloc>().state;
    if(popularMoviesBlocState.isLoading) return const FullScreenLoader();
    return Column(
      children: [
        Expanded(
          child: MovieMasonry(
            movies: popularMoviesBlocState.movies,
            loadNextPage: () => context.read<GetPopularMoviesBloc>().add(LoadNextPage()),
          ),
        ),
      ],
    );
  }
}
