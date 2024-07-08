import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../domain/entities/actor_details.dart';
import '../../domain/repositories/actor_details_repository.dart';

class ActorDetailsRepositoryImpl extends ActorDetailsRepository {
  final ActorDetailsDatasource _actorDetailsDatasource;

  ActorDetailsRepositoryImpl({
    required ActorDetailsDatasource actorDetailsDatasource,
  }) : _actorDetailsDatasource = actorDetailsDatasource;

  @override
  Future<Result<ActorDetails, DataError>> getActorDetailsById(int actorId) {
    return _actorDetailsDatasource.getActorDetailsById(actorId);
  }
}
