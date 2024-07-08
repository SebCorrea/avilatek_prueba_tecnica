part of 'actor_details_bloc.dart';

sealed class ActorDetailsEvent extends Equatable {
  const ActorDetailsEvent();
}

class GetActorDetails extends ActorDetailsEvent {
  final int actorId;

  const GetActorDetails(this.actorId);

  @override
  List<Object?> get props => [actorId];
}
