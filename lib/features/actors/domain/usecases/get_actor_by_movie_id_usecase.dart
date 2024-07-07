import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/repositories/actor_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

class GetActorByMovieIdUseCase extends UseCase<Future<Result<List<Actor>, DataError>>, int> {
  final ActorRepository _actorRepository;

  GetActorByMovieIdUseCase({
    required ActorRepository actorRepository,
  }) : _actorRepository = actorRepository;

  @override
  Future<Result<List<Actor>, DataError>> execute(int params) {
    return _actorRepository.getActorsByMovieId(params);
  }
}
