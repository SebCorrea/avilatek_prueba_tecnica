import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';

/// Clase responsable de mapear datos JSON a objetos [ActorDetails].
class ActorDetailsMapper {

  /// Crea un objeto [ActorDetails] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los datos del actor.
  ///
  /// Devuelve un objeto [ActorDetails] con los datos mapeados.
  static ActorDetails fromJson(Map<String, dynamic> json) => ActorDetails(
        id: json['id'],
        name: json['name'],
        biography: json['biography'],
        profilePath: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
        popularity: json['popularity'],
      );
}
