import 'package:avilatek_prueba_tecnica/config/constants/environment.dart';
import 'package:avilatek_prueba_tecnica/core/services/dot_env/dot_env_service.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/instance_names.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/datasources/movie_datasource_impl.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/get_popular_movies_bloc/get_popular_movies_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final Injector injector = Injector(
  services: [CommonServices(), MoviesInjectionService()],
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

    /*PopularMovies*/
    getIt.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(movieRepository: getIt()));
    getIt.registerFactory<GetPopularMoviesBloc>(() => GetPopularMoviesBloc(getPopularMoviesUseCase: getIt()));
  }
}
