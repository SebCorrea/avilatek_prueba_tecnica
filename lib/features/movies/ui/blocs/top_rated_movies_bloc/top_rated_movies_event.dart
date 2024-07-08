part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();
}

class OnPageChanged extends TopRatedMoviesEvent {
  final int index;

  const OnPageChanged(this.index);

  @override
  List<Object?> get props => [index];
}

class AutomaticPagedStarted extends TopRatedMoviesEvent {
  const AutomaticPagedStarted();

  @override
  List<Object?> get props => [];
}

class ListenIndex extends TopRatedMoviesEvent {
  final int initialIndex;

  const ListenIndex(this.initialIndex);

  @override
  List<Object?> get props => [initialIndex];
}
