import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesBloc({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(const PopularMoviesState()) {
    on<GetPopularMovies>(_getPopularMovies);
    on<LoadNextPage>(_loadNextPage);
  }

  Future<void> _getPopularMovies(GetPopularMovies event, Emitter<PopularMoviesState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getPopularMoviesUseCase.execute(1);

    if (response is Success && response.data != null) {
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: null,
          errorDescription: null,
          isError: false,
          movies: response.data,
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

  Future<void> _loadNextPage(LoadNextPage event, Emitter<PopularMoviesState> emit) async {
    if (state.isNextPageLoading) return;
    emit(state._copyWith(isNextPageLoading: true, currentPage: state.currentPage + 1));
    final response = await _getPopularMoviesUseCase.execute(state.currentPage);

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
