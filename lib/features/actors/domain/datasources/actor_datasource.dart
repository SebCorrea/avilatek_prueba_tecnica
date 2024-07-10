import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../entities/actor.dart';

/// Define la interfaz para obtener la lista de actores de una película
abstract class ActorDatasource {
  /// Obtiene la lista de actores de una película por su ID.
  ///
  /// [movieId] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene la lista de actores en caso de éxito, o un [DataError] en caso de error.
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId);
}
