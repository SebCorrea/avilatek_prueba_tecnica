import 'dart:math';

import 'package:avilatek_prueba_tecnica/config/theme/app_colors.dart';
import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/custom_network_image.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/services/get_it/injection_service.dart';
import '../../../../core/ui/utils/img_paths.dart';
import '../../../../core/ui/utils/ui_strings.dart';
import '../../../../core/ui/widgets/basic_appbar.dart';
import '../../../../core/ui/widgets/circular_gradient_icon_button.dart';
import '../../../../core/ui/widgets/fade_in_animation.dart';
import '../../../../core/ui/widgets/full_screen_error.dart';
import '../../../../core/ui/widgets/full_screen_loader.dart';
import '../../../../core/ui/widgets/movie_masonry.dart';
import '../../domain/entities/movie.dart';

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
        title: UIStrings.topRated,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => getIt<TopRatedMoviesBloc>()
                  ..add(GetTopRatedMovies())
                  ..add(const AutomaticPagedStarted())
                //..add(const AutomaticPagedStarted()),
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
    final topRatedMoviesBloc = context.watch<TopRatedMoviesBloc>().state;

    if (topRatedMoviesBloc.isError) {
      return FullScreenError(
        errorMessage: topRatedMoviesBloc.errorTitle!,
        errorDescription: topRatedMoviesBloc.errorDescription!,
      );
    }

    if (topRatedMoviesBloc.isLoading) return const FullScreenLoader();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviesCarousel(
            movies: topRatedMoviesBloc.carouselMovies,
            currentPage: topRatedMoviesBloc.selectedMovieIndex,
          ),
          const SizedBox(height: 8),
          _Dots(
            itemCount: topRatedMoviesBloc.carouselMovies.length,
            selectedDotIndex: topRatedMoviesBloc.selectedMovieIndex,
          ),
          _MoreMoviesSection(movies: topRatedMoviesBloc.movies),
        ],
      ),
    );
  }
}

class _MoreMoviesSection extends StatelessWidget {
  final List<Movie> movies;

  const _MoreMoviesSection({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top 20 Mejor Calificadas',
            style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          MovieMasonry(
            shrinkWrap: true,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            movies: movies,
            onClickMovie: (Movie movie) => context.push('${AppRoutes.movies}/${movie.id}'),
          ),
        ],
      ),
    );
  }
}

class _MoviesCarousel extends StatefulWidget {
  final List<Movie> movies;
  final int currentPage;

  const _MoviesCarousel({
    required this.movies,
    required this.currentPage,
  });

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
        CustomNetworkImage(
          imageUrl: movie.posterPath,
          onErrorImageUrl: NetworkImagesUrls.noPosterMovieUrl,
        ),
        const _BackgroundGradients(),
        _MovieInfo(
          movie: movie,
        )
      ],
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;

  const _MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            movie.title,
            style: context.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white50,
            ),
          ),
          const SizedBox(height: 4),
          _MovieAverage(average: movie.voteAverage),
        ],
      ),
    );
  }
}

class _MovieAverage extends StatelessWidget {
  final double average;

  const _MovieAverage({required this.average});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 25,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${average.toStringAsFixed(1)}/10',
          style: context.textTheme.titleMedium!.copyWith(
            color: AppColors.white100,
          ),
        ),
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
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              stops: [0.0, 1],
            ),
          ),
        ),
      ],
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
