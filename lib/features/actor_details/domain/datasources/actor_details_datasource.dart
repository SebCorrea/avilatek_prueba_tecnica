import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../entities/actor_details.dart';

/// Define la interfaz para obtener los detalles de un actor.
abstract class ActorDetailsDatasource {
  /// Obtiene los detalles de un actor por su ID.
  ///
  /// [actorId] El ID del actor.
  ///
  /// Devuelve un[Result] que contiene los detalles del actor en caso de éxito, o un [DataError] en caso de error.
  Future<Result<ActorDetails, DataError>> getActorDetailsById(int actorId);
}
