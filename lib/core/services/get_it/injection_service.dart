import 'package:avilatek_prueba_tecnica/config/constants/environment.dart';
import 'package:avilatek_prueba_tecnica/core/services/dot_env/dot_env_service.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/instance_names.dart';
import 'package:avilatek_prueba_tecnica/features/actors/data/repositories/actor_repository_impl.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/datasources/actor_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/repositories/actor_repository.dart';
import 'package:avilatek_prueba_tecnica/features/actors/ui/blocs/actors_bloc/actors_bloc.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/datasources/movie_datasource_impl.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/get_movie_by_id_usecase.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/actors/data/datasources/actor_datasource_impl.dart';
import '../../../features/actors/domain/usecases/get_actor_by_movie_id_usecase.dart';
import '../../../features/movies/ui/blocs/movie_details_bloc/movie_details_bloc.dart';
import '../../../features/movies/ui/blocs/popular_movies_bloc/popular_movies_bloc.dart';

final Injector injector = Injector(
  services: [
    CommonServices(),
    MoviesInjectionService(),
    ActorsInjectionService(),
  ],
);

class Injector {
  final List<InjectionService> services;

  Injector({required this.services});

  Future<void> injectAll() async => await Future.wait(
        services.map((service) => service.inject()),
      );
}

abstract class InjectionService {
  Future<void> inject();
}

final getIt = GetIt.instance;

class CommonServices extends InjectionService {
  @override
  Future<void> inject() async {
    /*Dio*/
    getIt.registerSingleton(
      instanceName: InstanceNames.dioMovieDb,
      Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          queryParameters: {
            'api_key': DotEnvService.getEnvVariable(Environment.movieDBApiKey),
            'language': 'es-MX',
          },
        ),
      ),
    );
  }
}

class MoviesInjectionService extends InjectionService {
  @override
  Future<void> inject() async {
    getIt.registerSingleton<MovieDatasource>(MovieDatasourceImpl(dio: getIt(instanceName: InstanceNames.dioMovieDb)));
    getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(movieDatasource: getIt()));

    /*Popular Movies*/
    getIt.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(movieRepository: getIt()));
    getIt.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(getPopularMoviesUseCase: getIt()));

    /*Movie*/
    getIt.registerSingleton<GetMovieByIdUseCase>(GetMovieByIdUseCase(movieRepository: getIt()));
    getIt.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(getMovieByIdUseCase: getIt()));
  }
}

class ActorsInjectionService extends InjectionService {
  @override
  Future<void> inject() async {
    getIt.registerSingleton<ActorDatasource>(ActorDatasourceImpl(dio: getIt(instanceName: InstanceNames.dioMovieDb)));
    getIt.registerSingleton<ActorRepository>(ActorRepositoryImpl(actorDatasource: getIt()));

    /*Actors*/
    getIt.registerSingleton<GetActorByMovieIdUseCase>(GetActorByMovieIdUseCase(actorRepository: getIt()));
    getIt.registerFactory<ActorsBloc>(() => ActorsBloc(getActorByMovieIdUseCase: getIt()));
  }
}
