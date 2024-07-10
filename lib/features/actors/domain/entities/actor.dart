/// Representa un actor en una película.
///
/// [id] El ID único del actor.
///
/// [name] El nombre del actor.
///
/// [profilePath] La ruta a la imagen de perfil del actor.
///
/// [character] El personaje que interpreta el actor en la película.
///
class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String character;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });
}
