import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../entities/actor.dart';

abstract class ActorDatasource {
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId);

  Future<Result<Actor, DataError>> getActorById(int actorId);
}
