import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';

class ActorMapper {
  static Actor fromJson(Map<String, dynamic> json) => Actor(
        id: json['id'],
        name: json['name'],
        profilePath: 'https://image.tmdb.org/t/p/w500${json["profile_path"]}',
        character: json['character'],
      );
}
