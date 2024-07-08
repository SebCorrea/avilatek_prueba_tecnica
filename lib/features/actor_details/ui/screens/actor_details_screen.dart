import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/injection_service.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/basic_appbar.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/circular_gradient_icon_button.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/custom_loader.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/error_message.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/full_screen_loader.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/ui/blocs/movies_actor_bloc/movies_actor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/ui/widgets/fade_in_animation.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../../../core/ui/widgets/movie_masonry.dart';
import '../blocs/actor_details_bloc/actor_details_bloc.dart';

class ActorDetailsScreen extends StatelessWidget {
  final int actorId;

  const ActorDetailsScreen({super.key, required this.actorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: CircularGradientIconButton(
          iconData: Icons.arrow_back_ios_new,
          onClick: () => context.pop(),
        ),
        title: 'Actor',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<ActorDetailsBloc>()..add(GetActorDetails(actorId))),
            BlocProvider(create: (_) => getIt<MoviesActorBloc>()..add(GetMoviesByActorId(actorId))),
          ],
          child: const _ActorDetailsView(),
        ),
      ),
    );
  }
}

class _ActorDetailsView extends StatelessWidget {
  const _ActorDetailsView();

  @override
  Widget build(BuildContext context) {
    final isActorDetailsLoading = context.watch<ActorDetailsBloc>().state.isLoading;
    final isMoviesLoading = context.watch<MoviesActorBloc>().state.isLoading;

    if (isActorDetailsLoading && isMoviesLoading) return const FullScreenLoader();

    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 16),
          _ActorDetails(),
          SizedBox(height: 36),
          _RelatedMovies(),
        ],
      ),
    );
  }
}

class _RelatedMovies extends StatelessWidget {
  const _RelatedMovies();

  @override
  Widget build(BuildContext context) {
    final moviesActorsBlocState = context.watch<MoviesActorBloc>().state;

    if (moviesActorsBlocState.isLoading) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const CustomLoader(size: 40),
      );
    }

    if (moviesActorsBlocState.isError) {
      return ErrorMessage(
        title: 'Error al cargar las películas',
        description: moviesActorsBlocState.errorDescription!,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Participó en',
          style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24.0),
        MovieMasonry(
          movies: moviesActorsBlocState.movies,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          onClickMovie: (Movie movie) => context.push('${AppRoutes.movies}/${movie.id}'),
        ),
      ],
    );
  }
}

class _ActorDetails extends StatelessWidget {
  const _ActorDetails();

  @override
  Widget build(BuildContext context) {
    final actorDetailsBlocState = context.watch<ActorDetailsBloc>().state;

    if (actorDetailsBlocState.isLoading) {
      return Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: const CustomLoader(size: 40),
      );
    }

    if (actorDetailsBlocState.isError) {
      return ErrorMessage(
        title: 'Error al cargar actor',
        description: actorDetailsBlocState.errorDescription!,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ActorImage(
          imageUrl: actorDetailsBlocState.actor!.profilePath,
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _ActorInfo(
            actor: actorDetailsBlocState.actor!,
          ),
        ),
      ],
    );
  }
}

class _ActorImage extends StatelessWidget {
  final String imageUrl;

  const _ActorImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(color: context.colorScheme.surface, shape: BoxShape.circle),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              fit: BoxFit.cover,
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return FadeInAnimation(child: child);
            return Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              color: Colors.amber,
              //child: const CustomLoader(size: 20),
            );
          },
        ),
      ),
    );
  }
}

class _ActorInfo extends StatelessWidget {
  final ActorDetails actor;

  const _ActorInfo({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          actor.name,
          style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          actor.biography.isEmpty ? 'Este actor no cuenta con biografía...' : actor.biography,
          style: context.textTheme.bodyMedium,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
