import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

class SearchMovieUseCase extends UseCase<Future<Result<List<Movie>, DataError>>, String> {
  final MovieRepository _movieRepository;

  SearchMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>, DataError>> execute(String params) {
    return _movieRepository.searchMovie(params);
  }
}
