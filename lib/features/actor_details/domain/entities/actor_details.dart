
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
class ActorDetails {
  final int id;
  final String name;
  final String biography;
  final String profilePath;
  final double popularity;

  ActorDetails({
    required this.id,
    required this.name,
    required this.biography,
    required this.profilePath,
    required this.popularity,
  });
}
