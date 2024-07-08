import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

import '../../../../core/domain/resources/result.dart';

abstract class ActorRepository {
  Future<Result<List<Actor>, DataError>> getActorsByMovieId(int movieId);

}
