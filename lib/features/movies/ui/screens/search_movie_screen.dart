import 'package:avilatek_prueba_tecnica/config/routes/routes.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/movie_masonry.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/get_it/injection_service.dart';
import '../../../../core/ui/utils/img_paths.dart';
import '../../../../core/ui/widgets/full_screen_error.dart';
import '../../../../core/ui/widgets/full_screen_loader.dart';
import '../../../../core/ui/widgets/custom_network_image.dart';
import '../../../../core/ui/widgets/search_app_bar.dart';
import '../../domain/entities/movie.dart';
import '../blocs/search_movie_bloc/search_movie_bloc.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PopularMoviesBloc>()..add(GetPopularMovies()),
          child: const _SearchMovieView(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchMovieBloc>(),
          child: const _SearchMovieView(),
        )
      ],
      child: const _SearchMovieView(),
    );
  }
}

class _SearchMovieView extends StatelessWidget {
  const _SearchMovieView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (String query) => context.read<SearchMovieBloc>().add(QueryChanged(query)),
        screenWidth: context.screenSize.width,
      ),
      body: const _Results(),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results();

  @override
  Widget build(BuildContext context) {
    final searchMovieBlocState = context.watch<SearchMovieBloc>().state;
    final popularMoviesBlocState = context.watch<PopularMoviesBloc>().state;

    if (searchMovieBlocState.isLoading || popularMoviesBlocState.isLoading) return const FullScreenLoader();

    if (searchMovieBlocState.movies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0).copyWith(top: 16.0),
        child: _EmptyResults(
          movies: popularMoviesBlocState.movies,
          onClickMovie: (Movie movie) => context.push('${AppRoutes.movies}/${movie.id}'),
          isEmptyResults: searchMovieBlocState.isEmptyResults,
        ),
      );
    }

    if (searchMovieBlocState.isError) {
      return FullScreenError(
        errorMessage: searchMovieBlocState.errorTitle!,
        errorDescription: searchMovieBlocState.errorDescription!,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: _SearchedMovies(
        movies: searchMovieBlocState.movies,
        onClickMovie: (Movie movie) => context.push('${AppRoutes.movies}/${movie.id}'),
      ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  final List<Movie> movies;
  final bool isEmptyResults;
  final void Function(Movie movie) onClickMovie;

  const _EmptyResults({required this.movies, required this.isEmptyResults, required this.onClickMovie});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (isEmptyResults) const _EmptyResultsMessage(),
        MovieMasonry(
          shrinkWrap: true,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          movies: movies,
          onClickMovie: onClickMovie,
        ),
      ],
    );
  }
}

class _EmptyResultsMessage extends StatelessWidget {
  const _EmptyResultsMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          UIStrings.emptyResultsMessage,
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Divider(
          thickness: 1,
          color: context.colorScheme.outline,
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}

class _SearchedMovies extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie movie) onClickMovie;

  const _SearchedMovies({
    required this.movies,
    required this.onClickMovie,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _SearchedMovieItem(
          movie: movie,
          onClickMovie: onClickMovie,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          color: context.colorScheme.outline,
        );
      },
    );
  }
}

class _SearchedMovieItem extends StatelessWidget {
  final Movie movie;
  final void Function(Movie movie) onClickMovie;

  const _SearchedMovieItem({required this.movie, required this.onClickMovie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onClickMovie(movie),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MovieImageContainer(movie: movie),
          const SizedBox(width: 16),
          Flexible(child: _MovieInfo(movie: movie))
        ],
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;

  const _MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          movie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _MovieAverage(
          average: movie.voteAverage,
        )
      ],
    );
  }
}

class _MovieAverage extends StatelessWidget {
  final double average;

  const _MovieAverage({required this.average});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
        ),
        const SizedBox(width: 4),
        Text(
          average.toStringAsFixed(1),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _MovieImageContainer extends StatelessWidget {
  final Movie movie;

  const _MovieImageContainer({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 110,
      child: Container(
        color: context.colorScheme.surface,
        child: CustomNetworkImage(
          imageUrl: movie.backdropPath,
          onErrorImageUrl: NetworkImagesUrls.noPosterMovieUrl,
        ),
      ),
    );
  }
}

