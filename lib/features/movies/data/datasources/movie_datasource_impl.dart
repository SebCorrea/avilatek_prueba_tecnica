import 'package:avilatek_prueba_tecnica/core/data/dio_exception_handler.dart';
import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/mappers/movie_mapper.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/models/movie_credits_model.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/models/movie_results_model.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/movie.dart';

/// Implementación de [MovieDatasource] que obtiene datos de películas desdeuna API remota utilizando [Dio].
///
/// [_dio] Una instancia de [Dio] para realizar solicitudes HTTP.
class MovieDatasourceImpl extends MovieDatasource {
  final Dio _dio;

  MovieDatasourceImpl({required Dio dio}) : _dio = dio;

  /// Obtiene una lista de películas populares.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page) async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {
          'page': page,
        },
      );
      final result = MovieResultsModel.fromJson(response.data);
      return Success(result.movies);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }

  /// Obtiene los detalles de una película por su ID.
  ///
  /// [id] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene los detalles de la película en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<Movie, DataError>> getMovieById(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final movie = MovieMapper.fromJson(response.data);
      return Success(movie);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }

  /// Obtiene una lista de películas en las que ha participado un actor.
  ///
  /// [id] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getMoviesByActorId(int id) async {
    try {
      final response = await _dio.get('/person/$id/movie_credits');
      final result = MovieCreditsModel.fromJson(response.data);
      return Success(result.movies);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }

  /// Obtiene una lista de películas mejor valoradas.
  ///
  /// [page] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> getTopRatedMovies(int page) async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          'page': page,
        },
      );
      final result = MovieResultsModel.fromJson(response.data);
      return Success(result.movies);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }

  /// Busca películas por título.
  ///
  /// [query] El término de búsqueda.
  ///
  /// Devuelve un [Result] que contiene la lista de películas encontradas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> searchMovie(String query) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {'query': query},
      );
      final result = MovieResultsModel.fromJson(response.data);
      return Success(result.movies);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }
}
