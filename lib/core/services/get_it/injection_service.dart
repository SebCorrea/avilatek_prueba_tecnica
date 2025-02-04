import 'package:avilatek_prueba_tecnica/config/constants/environment.dart';
import 'package:avilatek_prueba_tecnica/core/services/dot_env/dot_env_service.dart';
import 'package:avilatek_prueba_tecnica/core/services/get_it/instance_names.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/ui/blocs/actor_details_bloc/actor_details_bloc.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/ui/blocs/movies_actor_bloc/movies_actor_bloc.dart';
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
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/search_movie_usecase.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/search_movie_bloc/search_movie_bloc.dart';
import 'package:avilatek_prueba_tecnica/features/movies/ui/blocs/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/actor_details/data/datasources/actor_details_datasource_impl.dart';
import '../../../features/actor_details/data/repositories/actor_details_repository_impl.dart';
import '../../../features/actor_details/domain/repositories/actor_details_repository.dart';
import '../../../features/actor_details/domain/usecases/get_actor_details_by_id_usecase.dart';
import '../../../features/actors/data/datasources/actor_datasource_impl.dart';
import '../../../features/actors/domain/usecases/get_actor_by_movie_id_usecase.dart';
import '../../../features/movies/domain/usecases/get_movies_by_actor_id.dart';
import '../../../features/movies/ui/blocs/movie_details_bloc/movie_details_bloc.dart';
import '../../../features/movies/ui/blocs/popular_movies_bloc/popular_movies_bloc.dart';

/// Instancia del inyector de dependencias de la aplicación.
///
/// Esta instancia se utiliza para inyectar todas las dependencias necesarias
/// para el funcionamiento de la aplicación.
///
/// ## Uso
///
/// Debes llamar al método injector.injectAll() para inyectar todas las dependencias del proyecto.
///
///     void main() async {
///       await injector.injectAll();
///       // ...
///     }
final Injector injector = Injector(
  services: [
    CommonServices(),
    MoviesInjectionService(),
    ActorsInjectionService(),
    ActorDetailsInjectionService(),
  ],
);

/// Clase que gestiona la inyección de dependencias de la aplicación.
///
/// Esta clase recibe una lista de [InjectionService] y proporciona un método
/// para inyectar todas las dependencias de forma asíncrona.

class Injector {
  /// Lista de servicios de inyección de dependencias.
  final List<InjectionService> services;

  /// Constructor que recibe la lista de [services].
  Injector({required this.services});

  /// Inyecta todas las dependencias de forma asíncrona.
  Future<void> injectAll() async => await Future.wait(
        services.map((service) => service.inject()),
      );
}

/// Interfaz abstracta para servicios de inyección de dependencias.
abstract class InjectionService {
  /// Método abstracto que define la lógica de inyección de dependencias.
  Future<void> inject();
}

/// Instancia global de GetIt para la gestión de dependencias.
final getIt = GetIt.instance;

/// Servicio de inyección de dependencias comunes.
///
/// Este servicio registra dependencias comunes como Dio, Firebase, Cloudinary o cualquier otro servicio que sea
/// instanciado múltiples veces en la aplicacion.
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

/// Servicio de inyección de dependencias relacionadas con películas.
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

    /*Movies by Actor*/
    getIt.registerSingleton<GetMoviesByActorIdUseCase>(GetMoviesByActorIdUseCase(movieRepository: getIt()));
    getIt.registerFactory<MoviesActorBloc>(() => MoviesActorBloc(getMoviesByActorIdUseCase: getIt()));

    /*Top Rated Movies*/
    getIt.registerSingleton<GetTopRatedMoviesUseCase>(GetTopRatedMoviesUseCase(movieRepository: getIt()));
    getIt.registerFactory<TopRatedMoviesBloc>(() => TopRatedMoviesBloc(getTopRatedMoviesUseCase: getIt()));

    /*Search Movie*/
    getIt.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase(movieRepository: getIt()));
    getIt.registerFactory<SearchMovieBloc>(() => SearchMovieBloc(searchMovieUseCase: getIt()));
  }
}

/// Servicio de inyección de dependencias relacionadas con actores.
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

/// Servicio de inyección de dependencias relacionadas con detalles de actores.
class ActorDetailsInjectionService extends InjectionService {
  @override
  Future<void> inject() async {
    getIt.registerSingleton<ActorDetailsDatasource>(
        ActorDetailsDatasourceImpl(dio: getIt(instanceName: InstanceNames.dioMovieDb)));
    getIt.registerSingleton<ActorDetailsRepository>(ActorDetailsRepositoryImpl(actorDetailsDatasource: getIt()));

    /*Actor Details*/
    getIt.registerSingleton<GetActorDetailsByIdUseCase>(GetActorDetailsByIdUseCase(actorDetailsRepository: getIt()));
    getIt.registerFactory<ActorDetailsBloc>(() => ActorDetailsBloc(getActorDetailsByIdUseCase: getIt()));
  }
}
