part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovie extends MovieDetailsEvent {
  final int id;

  const GetMovie(this.id);

  @override
  List<Object?> get props => [id];
}

class ShowMovieInfo extends MovieDetailsEvent {
  const ShowMovieInfo();

  @override
  List<Object?> get props => [];
}
