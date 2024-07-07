import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/widgets/fade_in_animation.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../domain/entities/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          MovieImage(movie: movie),
          const _BackgroundGradient(),
          _MovieInfo(
            movie: movie,
          ),
        ],
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  final Movie movie;

  const MovieImage({super.key, required this.movie});

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

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.black950, Colors.transparent],
          stops: [0, 0.4],
        ),
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;

  const _MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium!.copyWith(color: AppColors.white50),
          ),
          Text(
            '${(movie.voteAverage * 10).toStringAsFixed(0)}% User Score',
            style: context.textTheme.bodySmall!.copyWith(color: AppColors.white200),
          ),
        ],
      ),
    );
  }
}
