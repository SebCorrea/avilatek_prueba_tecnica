import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/repositories/actor_repository.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../../../core/domain/resources/usecase.dart';

/// Caso de uso para obtener la lista de actores deuna película por su ID.
///
/// [_actorRepository] El repositorio para obtener la lista de actores.
class GetActorByMovieIdUseCase extends UseCase<Future<Result<List<Actor>, DataError>>, int> {
  final ActorRepository _actorRepository;

  GetActorByMovieIdUseCase({
    required ActorRepository actorRepository,
  }) : _actorRepository = actorRepository;

  /// Ejecuta el caso de uso para obtener la lista de actores de la película con el ID dado.
  ///
  /// [params] El ID de la película.
  ///
  /// Devuelve un [Result] que contiene la lista de actores en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<List<Actor>, DataError>> execute(int params) {
    return _actorRepository.getActorsByMovieId(params);
  }
}
