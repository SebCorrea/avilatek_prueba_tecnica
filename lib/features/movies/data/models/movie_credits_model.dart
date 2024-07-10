import '../../domain/entities/movie.dart';
import '../mappers/movie_mapper.dart';

/// Modelo que representa los créditos de películas de una persona (actor o miembrodel equipo).
///
/// [id] El ID de la persona.
///
/// [movies] La lista de películas en las que ha participado la persona.
class MovieCreditsModel{
  final int id;
  final List<Movie> movies;

  MovieCreditsModel({required this.id, required this.movies});

  /// Crea un [MovieCreditsModel] a partir de un mapa JSON.
  ///
  /// [json] El mapa JSON que contiene los datos de los créditos de películas de la persona.
  ///
  /// Devuelve un [MovieCreditsModel] con los datos mapeados.
  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) => MovieCreditsModel(
    id: json['id'],
    movies: List<Movie>.from(
      json['cast'].map((x) => MovieMapper.fromJson(x)),
    ),
  );
}