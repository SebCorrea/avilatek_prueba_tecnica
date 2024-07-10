/// Representa una película.
///
/// [id] El ID único de la película.
///
/// [adult] Indica si la película es para adultos.
///
/// [backdropPath] La ruta a la imagen de fondo de la película.
///
/// [genreIds] La lista de IDs de géneros a los que pertenece la película.
///
/// [originalLanguage] El idioma original de la película.
///
/// [originalTitle] El título original de la película.
///
/// [overview] Una descripción general de la película.
///
/// [popularity] La popularidad de la película.
///
/// [posterPath] La ruta a la imagen del póster de la película.
///
/// [releaseDate] La fecha de estreno de la película.
///
/// [title] El título de la película.
///
/// [video] Indica si la película tiene un video disponible.
///
/// [voteAverage]La calificación promedio de la película.
///
/// [voteCount] El número de votos que ha recibido la película.
class Movie {
  final int id;
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
