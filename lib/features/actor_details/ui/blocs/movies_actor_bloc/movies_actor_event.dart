part of 'movies_actor_bloc.dart';

sealed class MoviesActorEvent extends Equatable {
  const MoviesActorEvent();
}

class GetMoviesByActorId extends MoviesActorEvent {
  final int actorId;

  const GetMoviesByActorId(this.actorId);

  @override
  List<Object?> get props => [actorId];
}
