import 'dart:math';

import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it/injection_service.dart';
import '../../../../core/ui/utils/ui_strings.dart';
import '../../../../core/ui/widgets/basic_appbar.dart';
import '../../../../core/ui/widgets/circular_gradient_icon_button.dart';
import '../../../../core/ui/widgets/fade_in_animation.dart';
import '../../domain/entities/movie.dart';
import '../blocs/popular_movies_bloc/popular_movies_bloc.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: CircularGradientIconButton(
          iconData: Icons.menu,
          onClick: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: UIStrings.home,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<PopularMoviesBloc>()..add(GetPopularMovies()),
            ),
            BlocProvider(
              create: (_) => TopRatedMoviesBloc()..add(const AutomaticPagedStarted()),
            )
          ],
          child: const _TopRatedMoviesView(),
        ),
      ),
    );
  }
}

class _TopRatedMoviesView extends StatelessWidget {
  const _TopRatedMoviesView();

  @override
  Widget build(BuildContext context) {
    final moviesBloc = context.watch<PopularMoviesBloc>().state;
    final topRatedMoviesBloc = context.watch<TopRatedMoviesBloc>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _MoviesCarousel(
          movies: moviesBloc.movies.take(3).toList(),
          currentPage: topRatedMoviesBloc.selectedMovieIndex,
        ),
        const SizedBox(height: 8),
        _Dots(
          itemCount: 3,
          selectedDotIndex: topRatedMoviesBloc.selectedMovieIndex,
        ),
      ],
    );
  }
}

class _MoviesCarousel extends StatefulWidget {
  final List<Movie> movies;
  final int currentPage;

  const _MoviesCarousel({required this.movies, required this.currentPage});

  @override
  State<_MoviesCarousel> createState() => _MoviesCarouselState();
}

class _MoviesCarouselState extends State<_MoviesCarousel> {
  final PageController _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pageController.hasClients) {
      _pageController.jumpToPage(
        widget.currentPage,
      );
    }
    return SizedBox(
      height: context.screenSize.height * 0.6,
      child: PageView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.movies.length,
        onPageChanged: (value) => context.read<TopRatedMoviesBloc>().add(OnPageChanged(value)),
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: _MovieImageWithGradient(movie: movie),
          );
        },
      ),
    );
  }
}

class _MovieImageWithGradient extends StatelessWidget {
  final Movie movie;

  const _MovieImageWithGradient({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        _MovieImage(movie: movie),
        const _BackgroundGradients(),
      ],
    );
  }
}

class _BackgroundGradients extends StatelessWidget {
  const _BackgroundGradients();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black45,
                Colors.transparent,
                Colors.black45,
                Colors.black,
              ],
              stops: [0.0, 0.05, 0.35, 0.95, 1],
            ),
          ),
        ),

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.05, 0.25,0.85, 0.95],
            ),
          ),
        )
      ],
    );
  }
}

class _MovieImage extends StatelessWidget {
  final Movie movie;

  const _MovieImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        movie.posterPath,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            fit: BoxFit.cover,
            'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return const SizedBox();
          }
          return FadeInAnimation(child: child);
        },
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int itemCount;
  final int selectedDotIndex;

  const _Dots({
    required this.itemCount,
    required this.selectedDotIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          itemCount,
          (index) => _Dot(
            isSelected: index == selectedDotIndex,
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isSelected;

  const _Dot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isSelected ? pi / 4 : 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(8),
        height: isSelected ? 17 : 13,
        width: isSelected ? 17 : 13,
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(isSelected ? 4 : 20),
          border: Border.all(width: 2.0, color: context.colorScheme.surface),
        ),
      ),
    );
  }
}
