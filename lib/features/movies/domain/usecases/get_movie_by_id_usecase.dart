import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

class GetMovieByIdUseCase extends UseCase<Future<Result<Movie, DataError>>, int> {
  final MovieRepository _movieRepository;

  GetMovieByIdUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<Result<Movie, DataError>> execute(int params) {
    return _movieRepository.getMovieById(params);
  }
}
