import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/datasources/movie_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl({
    required MovieDatasource movieDatasource,
  }) : _movieDatasource = movieDatasource;

  @override
  Future<Result<List<Movie>, DataError>> getPopularMovies(int page) {
    return _movieDatasource.getPopularMovies(page);
  }

  @override
  Future<Result<Movie, DataError>> getMovieById(int id) {
    return _movieDatasource.getMovieById(id);
  }

  @override
  Future<Result<List<Movie>, DataError>> getMoviesByActorId(int id) {
    return _movieDatasource.getMoviesByActorId(id);
  }
}
