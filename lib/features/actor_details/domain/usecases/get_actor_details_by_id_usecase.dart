import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/usecase.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/repositories/actor_details_repository.dart';

/// Caso de uso para obtener los detalles de un actor por su ID.
///
///[_actorDetailsRepository] Elrepositorio para obtener los detalles del actor.
class GetActorDetailsByIdUseCase extends UseCase<Future<Result<ActorDetails, DataError>>, int> {
  final ActorDetailsRepository _actorDetailsRepository;

  GetActorDetailsByIdUseCase({
    required ActorDetailsRepository actorDetailsRepository,
  }) : _actorDetailsRepository = actorDetailsRepository;

  /// Ejecuta el caso de uso para obtener los detalles del actor con el ID dado.
  ///
  /// [params] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene los detalles del actor en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<ActorDetails, DataError>> execute(int params) {
    return _actorDetailsRepository.getActorDetailsById(params);
  }
}
