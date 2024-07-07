part of 'get_popular_movies_bloc.dart';

sealed class GetPopularMoviesEvent extends Equatable {
  const GetPopularMoviesEvent();
}

class GetPopularMovies extends GetPopularMoviesEvent {
  @override
  List<Object?> get props => [];
}

class LoadNextPage extends GetPopularMoviesEvent {
  @override
  List<Object?> get props => [];
}
