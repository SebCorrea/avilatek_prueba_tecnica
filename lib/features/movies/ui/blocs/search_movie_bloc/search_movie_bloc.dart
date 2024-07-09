import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/search_movie_usecase.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovieUseCase _searchMovieUseCase;
  Timer? _debounceTimer;

  SearchMovieBloc({required SearchMovieUseCase searchMovieUseCase})
      : _searchMovieUseCase = searchMovieUseCase,
        super(const SearchMovieState()) {
    on<QueryChanged>(_onQueryChanged);
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onQueryChanged(QueryChanged event, Emitter<SearchMovieState> emit) async {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      add(SearchMovies(event.query));
    });
  }

  Future<void> _onSearchMovies(SearchMovies event, Emitter<SearchMovieState> emit) async {
    if (event.query.isEmpty) {
      emit(
        state._copyWith(
          movies: [],
          isLoading: false
        ),
      );
      return;
    }

    final response = await _searchMovieUseCase.execute(event.query);

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

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
