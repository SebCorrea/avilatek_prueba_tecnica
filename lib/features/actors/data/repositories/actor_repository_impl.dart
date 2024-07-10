import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/datasources/actor_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/repositories/actor_repository.dart';
/// Implementación de [ActorRepository] que utiliza [ActorDatasource]para obtener la lista de actores de una película.

/// [_actorDatasource] La fuente de datos para obtener la lista de actores
class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource _actorDatasource;

  ActorRepositoryImpl({
    required ActorDatasource actorDatasource,
  }) : _actorDatasource = actorDatasource;

  /// Obtiene la lista de actores de una película por su ID.
  ///
  /// [movieId] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene la lista de actores en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId) {
    return _actorDatasource.getActorsByMovieId(movieId);
  }
}
