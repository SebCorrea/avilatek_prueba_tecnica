import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'get_popular_movies_event.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesBloc extends Bloc<GetPopularMoviesEvent, GetPopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  GetPopularMoviesBloc({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(const GetPopularMoviesState()) {
    on<GetPopularMovies>(_getPopularMovies);
    on<LoadNextPage>(_loadNextPage);
  }

  Future<void> _getPopularMovies(GetPopularMovies event, Emitter<GetPopularMoviesState> emit) async {
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
          errorMessage: null,
          isError: false,
          movies: response.data,
        ),
      );
    }

    if (response is Failure) {
      emit(
        state._copyWith(
          isLoading: false,
          errorMessage: response.error!.errorMessage,
          isError: true,
        ),
      );
    }
  }

  Future<void> _loadNextPage(LoadNextPage event, Emitter<GetPopularMoviesState> emit) async {
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
