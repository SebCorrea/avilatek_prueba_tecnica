part of 'get_popular_movies_bloc.dart';

class GetPopularMoviesState extends Equatable {
  final List<Movie> movies;
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final int currentPage;
  final bool isNextPageLoading;

  const GetPopularMoviesState({
    this.movies = const [],
    this.isLoading = true,
    this.isError = false,
    this.currentPage = 1,
    this.isNextPageLoading = false,
    this.errorMessage,
  });

  GetPopularMoviesState _copyWith({
    List<Movie>? movies,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    int? currentPage,
    bool? isNextPageLoading,
  }) =>
      GetPopularMoviesState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        currentPage: currentPage ?? this.currentPage,
        isNextPageLoading: isNextPageLoading ?? this.isNextPageLoading,
      );

  @override
  List<Object?> get props => [
        movies,
        isLoading,
        isError,
        errorMessage,
        currentPage,
        isNextPageLoading,
      ];
}
