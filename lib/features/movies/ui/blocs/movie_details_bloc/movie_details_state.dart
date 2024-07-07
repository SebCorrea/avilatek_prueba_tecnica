part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final Movie? movie;
  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;
  final bool showMovieInfo;

  const MovieDetailsState({
    this.movie,
    this.isLoading = true,
    this.isError = false,
    this.showMovieInfo = false,
    this.errorTitle,
    this.errorDescription,
  });

  MovieDetailsState _copyWith({
    Movie? movie,
    bool? isLoading,
    bool? isError,
    bool? showMovieInfo,
    String? errorTitle,
    String? errorDescription,
  }) =>
      MovieDetailsState(
        movie: movie ?? this.movie,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        showMovieInfo: showMovieInfo ?? this.showMovieInfo,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
      );

  @override
  List<Object?> get props => [
        movie,
        isLoading,
        isError,
        showMovieInfo,
        errorTitle,
        errorDescription,
      ];
}
