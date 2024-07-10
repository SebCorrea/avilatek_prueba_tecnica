import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

/// Caso de uso para obtener la lista de películas en las que ha participado un actor.
///
/// [_movieRepository] El repositorio para obtener la lista de películas.
class GetMoviesByActorIdUseCase extends UseCase<Future<Result<List<Movie>, DataError>>, int> {
  final MovieRepository _movieRepository;

  GetMoviesByActorIdUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  /// Ejecuta el caso de uso para obtener la lista de películas en las que ha participado el actor con el ID dado.
  ///
  /// [params] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> execute(int params) {
    return _movieRepository.getMoviesByActorId(params);
  }
}
