import 'package:avilatek_prueba_tecnica/features/movies/data/mappers/movie_mapper.dart';

import '../../domain/entities/movie.dart';

class MovieResultsModel {
  final int page;
  final List<Movie> movies;

  MovieResultsModel({required this.page, required this.movies});

  factory MovieResultsModel.fromJson(Map<String, dynamic> json) => MovieResultsModel(
        page: json['page'],
        movies: List<Movie>.from(
          json['results'].map((x) => MovieMapper.fromJson(x)),
        ),
      );
}
