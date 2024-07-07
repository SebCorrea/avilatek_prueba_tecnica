import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/injection_service.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/circular_gradient_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../core/ui/widgets/full_screen_error.dart';
import '../../../../core/ui/widgets/full_screen_loader.dart';
import '../../domain/entities/movie.dart';
import '../blocs/movie_details_bloc/movie_details_bloc.dart';
import '../widgets/fade_in_animation.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<MovieDetailsBloc>()..add(GetMovie(movieId)),
        child: const _MovieDetailsView(),
      ),
    );
  }
}

class _MovieDetailsView extends StatelessWidget {
  const _MovieDetailsView();

  @override
  Widget build(BuildContext context) {
    final getMovieBlocState = context.watch<MovieDetailsBloc>().state;
    if (getMovieBlocState.isError) {
      return FullScreenError(
        errorMessage: getMovieBlocState.errorTitle!,
        errorDescription: getMovieBlocState.errorDescription!,
      );
    }

    if (getMovieBlocState.isLoading) return const FullScreenLoader();
    return GestureDetector(
      onTap: () => context.read<MovieDetailsBloc>().add(const ShowMovieInfo()),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _FullScreenImage(movie: getMovieBlocState.movie!),
          const _BackgroundGradients(),
          _ShowInfoAnimated(
            showMovieInfo: getMovieBlocState.showMovieInfo,
            child: _InfoSection(movie: getMovieBlocState.movie!),
          ),
          Positioned(
            top: 36,
            left: 24,
            child: CircularGradientIconButton(
              iconData: Icons.close,
              onClick: context.pop,
            ),
          ),

        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final Movie movie;

  const _InfoSection({required this.movie});

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
              stops: [0, 0.2],
            ),
          ),
        ),
        _MovieInfo(movie: movie),
      ],
    );
  }
}

class _ShowInfoAnimated extends StatefulWidget {
  final bool showMovieInfo;
  final Widget child;

  const _ShowInfoAnimated({required this.showMovieInfo, required this.child});

  @override
  State<_ShowInfoAnimated> createState() => __ShowInfoAnimatedState();
}

class __ShowInfoAnimatedState extends State<_ShowInfoAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showMovieInfo) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;

  const _MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: context.textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white50,
            ),
          ),
          Text(
            '${(movie.voteAverage * 10).toStringAsFixed(0)}% User Score',
            style: context.textTheme.titleMedium!.copyWith(color: AppColors.white200),
          ),
        ],
      ),
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              stops: [0, 0.2],
            ),
          ),
        ),
      ],
    );
  }
}

class _FullScreenImage extends StatelessWidget {
  final Movie movie;

  const _FullScreenImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      movie.posterPath,
      fit: BoxFit.cover,
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
    );
  }
}
