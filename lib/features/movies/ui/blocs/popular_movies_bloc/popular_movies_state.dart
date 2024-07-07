part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  final List<Movie> movies;
  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;
  final int currentPage;
  final bool isNextPageLoading;

  const PopularMoviesState({
    this.movies = const [],
    this.isLoading = true,
    this.isError = false,
    this.currentPage = 1,
    this.isNextPageLoading = false,
    this.errorTitle,
    this.errorDescription,
  });

  PopularMoviesState _copyWith({
    List<Movie>? movies,
    bool? isLoading,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
    int? currentPage,
    bool? isNextPageLoading,
  }) =>
      PopularMoviesState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
        currentPage: currentPage ?? this.currentPage,
        isNextPageLoading: isNextPageLoading ?? this.isNextPageLoading,
      );

  @override
  List<Object?> get props => [
        movies,
        isLoading,
        isError,
        errorTitle,
        errorDescription,
        currentPage,
        isNextPageLoading,
      ];
}
