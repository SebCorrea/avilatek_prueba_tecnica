import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';

/// Clase responsable de mapear datos JSON a objetos [Movie].
class MovieMapper {

  /// Crea un objeto [Movie] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los datos de la película.
  ///
  /// Devuelve un objeto [Movie] con los datos mapeados.
  static Movie fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: 'https://image.tmdb.org/t/p/w500${json["backdrop_path"]}',
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: 'https://image.tmdb.org/t/p/w500${json["poster_path"]}',
        releaseDate: json["release_date"] == '' ? null : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
