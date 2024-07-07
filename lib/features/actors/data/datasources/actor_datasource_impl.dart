import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actors/data/models/movie_actors_model.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/datasources/actor_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/dio_exception_handler.dart';

class ActorDatasourceImpl extends ActorDatasource {
  final Dio _dio;

  ActorDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Result<Actor, DataError>> getActorById(int actorId) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId/credits');
      final result = MovieActorsModel.fromJson(response.data);
      return Success(result.actors);
    } on DioException catch (e) {
      final error = DioExceptionHandler().handle(e);
      return Failure(error);
    } catch (e) {
      return Failure(NetworkError.unknown);
    }
  }
}
