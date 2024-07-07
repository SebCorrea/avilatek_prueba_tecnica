import 'package:avilatek_prueba_tecnica/core/data/dio_exception_handler.dart';
import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/movies/data/models/movie_results_model.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/movie.dart';

class MovieDatasourceImpl extends MovieDatasource {
  final Dio _dio;

  MovieDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Result<List<Movie>, DataError>> getPopularMovies({int page = 1}) async {
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
}
