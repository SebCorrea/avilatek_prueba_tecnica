import '../../domain/entities/movie.dart';
import '../mappers/movie_mapper.dart';

class MovieCreditsModel{
  final int id;
  final List<Movie> movies;

  MovieCreditsModel({required this.id, required this.movies});

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) => MovieCreditsModel(
    id: json['id'],
    movies: List<Movie>.from(
      json['cast'].map((x) => MovieMapper.fromJson(x)),
    ),
  );
}