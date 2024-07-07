import 'package:avilatek_prueba_tecnica/features/actors/data/mappers/actor_mapper.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

class MovieActorsModel {
  final int movieId;
  final List<Actor> actors;

  MovieActorsModel({required this.movieId, required this.actors});

  factory MovieActorsModel.fromJson(Map<String, dynamic> json) => MovieActorsModel(
        movieId: json['id'],
        actors: List<Actor>.from(
          json['cast'].map((x) => ActorMapper.fromJson(x)),
        ),
      );
}
