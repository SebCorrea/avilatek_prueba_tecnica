import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

/// Clase responsable de mapear datos JSON a objetos [Actor].
class ActorMapper {
  /// Crea un objeto [Actor] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los datos del actor.
  ///
  /// Devuelve un objeto [Actor] con los datos mapeados.
  static Actor fromJson(Map<String, dynamic> json) => Actor(
        id: json['id'],
        name: json['name'],
        profilePath: 'https://image.tmdb.org/t/p/w500${json["profile_path"]}',
        character: json['character'],
      );
}
