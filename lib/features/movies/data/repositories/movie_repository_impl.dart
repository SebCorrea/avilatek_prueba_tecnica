import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';

/// Implementación de [MovieRepository] que utiliza [MovieDatasource] para obtener datos de películas.
///
/// [_movieDatasource] La fuente de datos para obtener datos de películas.
class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl({
    required MovieDatasource movieDatasource,
  }) : _movieDatasource = movieDatasource;

  /// Obtiene una lista de películas populares.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page) {
    return _movieDatasource.getPopularMovies(page);
  }

  /// Obtienelos detalles de una película por su ID.
  ///
  /// [id] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene los detalles de la película en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<Movie, DataError>> getMovieById(int id) {
    return _movieDatasource.getMovieById(id);
  }

  /// Obtiene una lista de películas en las que ha participado un actor.
  ///
  /// [id] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getMoviesByActorId(int id) {
    return _movieDatasource.getMoviesByActorId(id);
  }

  /// Obtiene una lista de películas mejor valoradas.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista depelículas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getTopRatedMovies(int page) {
    return _movieDatasource.getTopRatedMovies(page);
  }

  /// Busca películas por título.
  ///
  /// [query] El término de búsqueda.
  ///
  /// Devuelve un [Result] que contiene la lista de películas encontradas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> searchMovie(String query) {
    return _movieDatasource.searchMovie(query);
  }
}
