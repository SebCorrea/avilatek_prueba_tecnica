import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/usecase.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/repositories/actor_details_repository.dart';

class GetActorDetailsByIdUseCase extends UseCase<Future<Result<ActorDetails, DataError>>, int> {
  final ActorDetailsRepository _actorDetailsRepository;

  GetActorDetailsByIdUseCase({
    required ActorDetailsRepository actorDetailsRepository,
  }) : _actorDetailsRepository = actorDetailsRepository;

  @override
  Future<Result<ActorDetails, DataError>> execute(int params) {
    return _actorDetailsRepository.getActorDetailsById(params);
  }
}
