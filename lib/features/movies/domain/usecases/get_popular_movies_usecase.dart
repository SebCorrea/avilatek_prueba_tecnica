import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

/// Caso de uso para obtener una lista de películas populares
///
/// [_movieRepository] El repositorio para obtener la lista depelículas populares.
class GetPopularMoviesUseCase extends UseCase<Future<Result<List<Movie>, DataError>>, int> {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  /// Ejecuta el caso de uso para obtener la lista de películas populares para la página dada.
  ///
  /// [params] El número de página de resultados a obtener.
  ///
  /// Devuelve un [Result] que contiene la lista de películas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> execute(int params) {
    return _movieRepository.getPopularMovies(params);
  }
}
