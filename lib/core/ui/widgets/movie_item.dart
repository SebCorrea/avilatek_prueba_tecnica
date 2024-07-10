import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
import '../utils/img_paths.dart';
import '../utils/ui_strings.dart';
import '../../../features/movies/domain/entities/movie.dart';
import 'custom_network_image.dart';


/// Un widget que muestra información sobre una película, incluyendo su póster, título y puntuación.
///
/// [movie] Película a mostrar
///
/// [onClickMovie] Función que se ejecuta al hacer click en una película
class MovieItem extends StatelessWidget {
  final Movie movie;
  final void Function(Movie movie) onClickMovie;

  const MovieItem({
    super.key,
    required this.movie,
    required this.onClickMovie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClickMovie(movie),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: context.colorScheme.surface,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomNetworkImage(
                imageUrl: movie.posterPath,
                onErrorImageUrl: NetworkImagesUrls.noPosterMovieUrl,
              ),
              const _BackgroundGradient(),
              _MovieInfo(
                movie: movie,
              ),
            ],
          ),
        ),
      ),
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
            UIStrings.replaceUIString(UIStrings.userScoreLabel, (movie.voteAverage * 10).toStringAsFixed(0)),
            style: context.textTheme.bodySmall!.copyWith(color: AppColors.white200),
          ),
        ],
      ),
    );
  }
}
