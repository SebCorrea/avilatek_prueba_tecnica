part of 'search_movie_bloc.dart';

sealed class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class QueryChanged extends SearchMovieEvent {
  final String query;

  const QueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchMovies extends SearchMovieEvent {
  final String query;

  const SearchMovies(this.query);

  @override
  List<Object?> get props => [query];
}
