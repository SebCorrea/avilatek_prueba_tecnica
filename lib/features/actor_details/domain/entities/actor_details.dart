import 'package:equatable/equatable.dart';

/// Representa los detalles de un actor.
///
///  [id] El ID único del actor.
///
/// [name] El nombre del actor.
///
/// [biography] La biografía del actor.
///
/// [profilePath] La ruta a la imagen de perfil del actor.
///
/// [popularity] La popularidad del actor.
///
class ActorDetails extends Equatable {
  final int id;
  final String name;
  final String biography;
  final String profilePath;
  final double popularity;

  const ActorDetails({
    required this.id,
    required this.name,
    required this.biography,
    required this.profilePath,
    required this.popularity,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        biography,
        profilePath,
        popularity,
      ];
}
