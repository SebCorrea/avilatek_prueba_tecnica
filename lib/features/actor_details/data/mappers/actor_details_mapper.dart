import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';

class ActorDetailsMapper {
  static ActorDetails fromJson(Map<String, dynamic> json) => ActorDetails(
        id: json['id'],
        name: json['name'],
        biography: json['biography'],
        profilePath: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
        popularity: json['popularity'],
      );
}
