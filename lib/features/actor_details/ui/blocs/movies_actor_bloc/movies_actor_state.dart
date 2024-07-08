part of 'movies_actor_bloc.dart';


class MoviesActorState extends Equatable {
  final List<Movie> movies;
  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;

  const MoviesActorState({
    this.movies = const [],
    this.isLoading = true,
    this.isError = false,
    this.errorTitle,
    this.errorDescription,
  });

  MoviesActorState _copyWith({
    List<Movie>? movies,
    bool? isLoading,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
  }) =>
      MoviesActorState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
      );

  @override
  List<Object?> get props => [
    movies,
    isLoading,
    isError,
    errorTitle,
    errorDescription,
  ];
}
