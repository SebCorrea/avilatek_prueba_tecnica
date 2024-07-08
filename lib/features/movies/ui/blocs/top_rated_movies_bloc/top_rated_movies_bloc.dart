import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../domain/entities/movie.dart';

part 'top_rated_movies_event.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final StreamController<int> selectedIndexStream = StreamController<int>();
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  TopRatedMoviesBloc({required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase})
      : _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
        super(const TopRatedMoviesState()) {
    on<OnPageChanged>(_onMoviePaged);
    on<AutomaticPagedStarted>(_onAutomaticPagedStarted);
    on<ListenIndex>(_listenIndex);
    on<GetTopRatedMovies>(_getTopRatedMovies);
    on<LoadNextPage>(_loadNextPage);
  }

  void _onMoviePaged(OnPageChanged event, Emitter<TopRatedMoviesState> emit) {
    emit(
      state._copyWith(
        selectedMovieIndex: event.index,
      ),
    );
  }

  Future<void> _onAutomaticPagedStarted(AutomaticPagedStarted event, Emitter<TopRatedMoviesState> emit) async {
    _generateSequence(0);
    if (selectedIndexStream.hasListener) await selectedIndexStream.close();
    selectedIndexStream.stream.listen((event) {
      add(ListenIndex(event));
    });
  }

  Future<void> _generateSequence(int currentIndex) async {
    await Future.delayed(const Duration(seconds: 5));
    selectedIndexStream
        .add(state.selectedMovieIndex == state.carouselMovies.length - 1 ? 0 : state.selectedMovieIndex + 1);
    _generateSequence(state.selectedMovieIndex == state.carouselMovies.length - 1 ? 0 : state.selectedMovieIndex + 1);
  }

  @override
  Future<void> close() async {
    await selectedIndexStream.close();
    return super.close();
  }

  FutureOr<void> _listenIndex(ListenIndex event, Emitter<TopRatedMoviesState> emit) async {
    emit(state._copyWith(selectedMovieIndex: event.index));
  }

  Future<void> _getTopRatedMovies(GetTopRatedMovies event, Emitter<TopRatedMoviesState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getTopRatedMoviesUseCase.execute(1);

    if (response is Success && response.data != null) {
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: null,
          errorDescription: null,
          isError: false,
          movies: response.data,
          carouselMovies: response.data!.take(5).toList(),
        ),
      );
    }

    if (response is Failure) {
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: response.error!.errorTitle,
          errorDescription: response.error!.errorDescription,
          isError: true,
        ),
      );
    }
  }

  Future<void> _loadNextPage(LoadNextPage event, Emitter<TopRatedMoviesState> emit) async {
    if (state.isNextPageLoading) return;
    emit(state._copyWith(isNextPageLoading: true, currentPage: state.currentPage + 1));
    final response = await _getTopRatedMoviesUseCase.execute(state.currentPage);

    if (response is Success && response.data != null) {
      emit(
        state._copyWith(
          movies: [...state.movies, ...response.data!],
        ),
      );
    }

    emit(state._copyWith(isNextPageLoading: false));
  }
}
