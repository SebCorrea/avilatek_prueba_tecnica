import 'package:avilatek_prueba_tecnica/features/actors/data/mappers/actor_mapper.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

/// Modelo que representa la respuesta los actores obtenidos de la API remota.
///
/// [movieId] El ID de la película.
///
/// [actors] La lista de actores de la película
class MovieActorsModel {
  final int movieId;
  final List<Actor> actors;

  MovieActorsModel({required this.movieId, required this.actors});

  /// Crea un [MovieActorsModel] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los datos de los actores de la película.
  ///
  /// Devuelve un [MovieActorsModel] con los datos mapeados.
  factory MovieActorsModel.fromJson(Map<String, dynamic> json) => MovieActorsModel(
        movieId: json['id'],
        actors: List<Actor>.from(
          json['cast'].map((x) => ActorMapper.fromJson(x)),
        ),
      );
}
