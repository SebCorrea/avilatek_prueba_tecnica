part of 'search_movie_bloc.dart';

class SearchMovieState extends Equatable {
  final List<Movie> movies;
  final bool isLoading;
  final bool isError;
  final bool isEmptyResults;

  final String? errorTitle;
  final String? errorDescription;

  const SearchMovieState({
    this.movies = const [],
    this.isLoading = false,
    this.isEmptyResults = false,
    this.isError = false,
    this.errorTitle,
    this.errorDescription,
  });

  SearchMovieState _copyWith({
    List<Movie>? movies,
    bool? isLoading,
    bool? isEmptyResults,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
  }) =>
      SearchMovieState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        isEmptyResults: isEmptyResults ?? this.isEmptyResults,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
      );

  @override
  List<Object?> get props => [
        movies,
        isLoading,
        isError,
        isEmptyResults,
        errorTitle,
        errorDescription,
      ];
}
