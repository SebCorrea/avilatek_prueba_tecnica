import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';

import '../../../../core/domain/resources/result.dart';
import '../entities/movie.dart';

abstract class MovieDatasource {
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page);

  Future<Result<Movie, DataError>> getMovieById(int id);

  Future<Result<List<Movie>, DataError>> getMoviesByActorId(int id);

  Future<Result<List<Movie>, DataError>> getTopRatedMovies(int page);

  Future<Result<List<Movie>, DataError>> searchMovie(String query);

}
