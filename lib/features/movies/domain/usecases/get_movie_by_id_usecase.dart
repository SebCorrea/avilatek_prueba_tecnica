import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

/// Caso de uso para obtener los detalles de una película por suID.
///
/// [_movieRepository] El repositorio para obtener los detallesde la película.
class GetMovieByIdUseCase extends UseCase<Future<Result<Movie, DataError>>, int> {
  final MovieRepository _movieRepository;

  GetMovieByIdUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  /// Ejecuta el caso de uso para obtener los detalles de la película con el ID dado.
  ///
  /// [params] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene los detalles de la película en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<Movie, DataError>> execute(int params) {
    return _movieRepository.getMovieById(params);
  }
}
