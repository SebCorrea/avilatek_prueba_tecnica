part of 'popular_movies_bloc.dart';

sealed class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();
}

class GetPopularMovies extends PopularMoviesEvent {
  @override
  List<Object?> get props => [];
}

class LoadNextPage extends PopularMoviesEvent {
  @override
  List<Object?> get props => [];
}
