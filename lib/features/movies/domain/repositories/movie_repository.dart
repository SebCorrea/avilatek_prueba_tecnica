import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';

import '../../../../core/domain/resources/result.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page);

  Future<Result<Movie, DataError>> getMovieById(int id);
}
