part of 'top_rated_movies_bloc.dart';

class TopRatedMoviesState extends Equatable {
  final int selectedMovieIndex;

  const TopRatedMoviesState({
    this.selectedMovieIndex = 0,
  });

  TopRatedMoviesState _copyWith({
    int? selectedMovieIndex,
  }) =>
      TopRatedMoviesState(
        selectedMovieIndex: selectedMovieIndex ?? this.selectedMovieIndex,
      );

  @override
  List<Object?> get props => [
        selectedMovieIndex,
      ];
}
