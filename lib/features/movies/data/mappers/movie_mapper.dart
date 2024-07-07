import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';

class MovieMapper {
  static Movie fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] != ''
            ? 'https://image.tmdb.org/t/p/w500${json["backdrop_path"]}'
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] != ''
            ? 'https://image.tmdb.org/t/p/w500${json["backdrop_path"]}'
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
