import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart';

import '../../../../core/domain/errors/data_error.dart';
import '../../../../core/domain/resources/result.dart';
import '../../domain/entities/actor_details.dart';
import '../../domain/repositories/actor_details_repository.dart';

/// Implementación de[ActorDetailsRepository] que utiliza [ActorDetailsDatasource] para obtener detalles de actores.
///
/// [_actorDetailsDatasource] La fuente de datos para obtener detalles de actores.
class ActorDetailsRepositoryImpl extends ActorDetailsRepository {
  final ActorDetailsDatasource _actorDetailsDatasource;

  ActorDetailsRepositoryImpl({
    required ActorDetailsDatasource actorDetailsDatasource,
  }) : _actorDetailsDatasource = actorDetailsDatasource;

  /// Obtiene los detalles de un actor por su ID.
  ///
  /// [actorId] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene los detalles del actor en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<ActorDetails, DataError>> getActorDetailsById(int actorId) {
    return _actorDetailsDatasource.getActorDetailsById(actorId);
  }
}
