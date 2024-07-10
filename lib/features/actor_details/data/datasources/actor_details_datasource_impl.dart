import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/data/mappers/actor_details_mapper.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/dio_exception_handler.dart';

/// Implementación de [ActorDetailsDatasource] que obtiene los detallesde un actor desde la API
/// remota de The MovieDB utilizando [Dio].
///
/// [_dio] Una instancia de [Dio] para realizar solicitudes HTTP.
class ActorDetailsDatasourceImpl extends ActorDetailsDatasource {
  final Dio _dio;

  ActorDetailsDatasourceImpl({required Dio dio}) : _dio = dio;

  /// Obtiene los detalles de un actor por su ID.
  ///
  /// [actorId] El ID del actor.
  ///
  /// Devuelve un [Result] que contiene los detalles del actor en caso de éxito, o un [DataError] en caso de error.
  @override
  Future<Result<ActorDetails, DataError>> getActorDetailsById(int actorId) async {
    try {
      final response = await _dio.get('/person/$actorId');
      final actors = ActorDetailsMapper.fromJson(response.data);
      return Success(actors);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }
}
