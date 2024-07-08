part of 'actor_details_bloc.dart';

class ActorDetailsState extends Equatable {
  final ActorDetails? actor;
  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;

  const ActorDetailsState({
    this.actor,
    this.isLoading = true,
    this.isError = false,
    this.errorTitle,
    this.errorDescription,
  });

  ActorDetailsState _copyWith({
    ActorDetails? actor,
    bool? isLoading,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
  }) =>
      ActorDetailsState(
        actor: actor ?? this.actor,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
      );

  @override
  List<Object?> get props => [
        actor,
        isLoading,
        isError,
        errorTitle,
        errorDescription,
      ];
}
