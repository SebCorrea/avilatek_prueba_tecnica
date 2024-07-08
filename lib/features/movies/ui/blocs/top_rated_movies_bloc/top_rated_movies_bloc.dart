import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_movies_event.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final StreamController<int> selectedIndexStream = StreamController<int>();

  TopRatedMoviesBloc() : super(const TopRatedMoviesState()) {
    on<OnPageChanged>(_onMoviePaged);
    on<AutomaticPagedStarted>(_onAutomaticPagedStarted);
    on<ListenIndex>(_listenIndex);
  }

  void _onMoviePaged(OnPageChanged event, Emitter<TopRatedMoviesState> emit) {
    emit(
      state._copyWith(
        selectedMovieIndex: event.index,
      ),
    );
  }

  Future<void> _onAutomaticPagedStarted(AutomaticPagedStarted event, Emitter<TopRatedMoviesState> emit) async {
    _automaticChangePage(0);
    selectedIndexStream.stream.listen((event) {
      add(ListenIndex(event));
    });
  }

  Future<void> _automaticChangePage(int currentIndex) async {
    await Future.delayed(const Duration(seconds: 5));
    selectedIndexStream.add(state.selectedMovieIndex == 2 ? 0 : state.selectedMovieIndex + 1);
    _automaticChangePage(state.selectedMovieIndex == 2 ? 0 :state.selectedMovieIndex + 1);
  }

  @override
  Future<void> close() {
    selectedIndexStream.close();
    return super.close();
  }

  FutureOr<void> _listenIndex(ListenIndex event, Emitter<TopRatedMoviesState> emit) async {
    emit(state._copyWith(selectedMovieIndex: event.initialIndex));
  }
}
