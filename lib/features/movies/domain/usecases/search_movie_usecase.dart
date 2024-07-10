import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

/// Caso de uso para buscar películas por título.
///
/// [_movieRepository] El repositorio para buscar películas.
class SearchMovieUseCase extends UseCase<Future<Result<List<Movie>, DataError>>, String> {
  final MovieRepository _movieRepository;

  SearchMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  /// Ejecuta el caso de uso para buscar películas con el término dado.
  ///
  /// [params] El término de búsqueda.
  ///
  /// Devuelve un [Result] que contiene la lista de películas encontradas en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Movie>, DataError>> execute(String params) {
    return _movieRepository.searchMovie(params);
  }
}
