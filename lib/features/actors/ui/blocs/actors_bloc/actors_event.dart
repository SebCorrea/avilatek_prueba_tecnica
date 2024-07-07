part of 'actors_bloc.dart';

sealed class ActorsEvent extends Equatable {
  const ActorsEvent();
}

class GetActors extends ActorsEvent {
  final int movieId;

  const GetActors(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
