part of 'top_rated_movies_bloc.dart';

class TopRatedMoviesState extends Equatable {
  final int selectedMovieIndex;
  final List<Movie> movies;
  final List<Movie> carouselMovies;

  final bool isLoading;
  final bool isError;
  final String? errorTitle;
  final String? errorDescription;
  final int currentPage;
  final bool isNextPageLoading;

  const TopRatedMoviesState({
    this.selectedMovieIndex = 0,
    this.movies = const [],
    this.carouselMovies = const [],
    this.isLoading = true,
    this.isError = false,
    this.currentPage = 1,
    this.isNextPageLoading = false,
    this.errorTitle,
    this.errorDescription,
  });

  TopRatedMoviesState _copyWith({
    int? selectedMovieIndex,
    List<Movie>? movies,
    List<Movie>? carouselMovies,
    bool? isLoading,
    bool? isError,
    String? errorTitle,
    String? errorDescription,
    int? currentPage,
    bool? isNextPageLoading,
  }) =>
      TopRatedMoviesState(
        selectedMovieIndex: selectedMovieIndex ?? this.selectedMovieIndex,
        movies: movies ?? this.movies,
        carouselMovies: carouselMovies ?? this.carouselMovies,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorDescription: errorDescription ?? this.errorDescription,
        errorTitle: errorTitle ?? this.errorTitle,
        currentPage: currentPage ?? this.currentPage,
        isNextPageLoading: isNextPageLoading ?? this.isNextPageLoading,
      );

  @override
  List<Object?> get props => [
        selectedMovieIndex,
        movies,
        isLoading,
        isError,
        errorTitle,
        errorDescription,
        currentPage,
        isNextPageLoading,
      ];
}
