import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/datasources/actor_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource _actorDatasource;

  ActorRepositoryImpl({
    required ActorDatasource actorDatasource,
  }) : _actorDatasource = actorDatasource;

  @override
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId) {
    return _actorDatasource.getActorsByMovieId(movieId);
  }
}
