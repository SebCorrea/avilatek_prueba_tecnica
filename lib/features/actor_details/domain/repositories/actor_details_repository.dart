import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../entities/actor_details.dart';

abstract class ActorDetailsRepository {
  Future<Result<ActorDetails, DataError>> getActorDetailsById(int actorId);
}
