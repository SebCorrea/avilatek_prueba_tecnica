import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

import '../../../../core/domain/resources/result.dart';

/// Define la interfaz para obtener la lista de actores de una película
abstract class ActorRepository {
  /// Obtiene la lista de actores de una película por su ID.
  ///
  /// [movieId] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene la lista de actores en caso de éxito, o un [DataError] en caso de error.
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId);
}
