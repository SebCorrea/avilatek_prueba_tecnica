import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';

import '../../../../core/domain/resources/result.dart';
import '../entities/movie.dart';

/// Define la interfaz para obtener informacion de las películas.
abstract class MovieDatasource {
  /// Obtiene una lista de películas populares.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page);

  /// Obtiene los detalles de una película por su ID.
  ///
  /// [id] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene los detalles de la película en caso de éxito, o un [DataError] en caso de error.
  Future<Result<Movie, DataError>> getMovieById(int id);

  /// Obtiene una lista de películas en las que ha participado un actor.
  ///
  /// [id] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  Future<Result<List<Movie>, DataError>> getMoviesByActorId(int id);

  /// Obtiene una lista de películas mejor valoradas.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  Future<Result<List<Movie>, DataError>> getTopRatedMovies(int page);

  /// Busca películas por título.
  ///
  /// [query] El término de búsqueda.
  ///
  /// Devuelve un [Result] que contiene la lista de películas encontradas en caso de éxito, o un [DataError] en caso de error.
  Future<Result<List<Movie>, DataError>> searchMovie(String query);
}
