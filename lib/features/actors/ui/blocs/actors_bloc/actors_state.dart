part of 'actors_bloc.dart';

class ActorsState extends Equatable {
  final List<Actor> actors;
  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;

  const ActorsState({
    this.actors = const [],
    this.isLoading = true,
    this.isError = false,
    this.errorTitle,
    this.errorDescription,
  });

  ActorsState _copyWith({
    List<Actor>? actors,
    bool? isLoading,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
  }) =>
      ActorsState(
        actors: actors ?? this.actors,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
      );

  @override
  List<Object?> get props => [
        actors,
        isLoading,
        isError,
        errorTitle,
        errorDescription,
      ];
}
