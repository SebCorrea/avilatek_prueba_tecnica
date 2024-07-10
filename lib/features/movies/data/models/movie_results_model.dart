import 'package:avilatek_prueba_tecnica/features/movies/data/mappers/movie_mapper.dart';

import '../../domain/entities/movie.dart';

/// Modelo que representa los resultados de una búsqueda de películas.
///
/// [page] El número de página de los resultados.
///
/// [movies] La lista de películas encontradas.
class MovieResultsModel {
  final int page;
  final List<Movie> movies;

  MovieResultsModel({required this.page, required this.movies});

  /// Crea un [MovieResultsModel] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los resultados de la búsqueda de películas.
  ///
  /// Devuelve un [MovieResultsModel] con los datos mapeados.
  factory MovieResultsModel.fromJson(Map<String, dynamic> json) => MovieResultsModel(
        page: json['page'],
        movies: List<Movie>.from(
          json['results'].map((x) => MovieMapper.fromJson(x)),
        ),
      );
}
