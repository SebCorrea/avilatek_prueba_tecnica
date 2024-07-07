import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_movie_by_id_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieByIdUseCase _getMovieByIdUseCase;

  MovieDetailsBloc({required GetMovieByIdUseCase getMovieByIdUseCase})
      : _getMovieByIdUseCase = getMovieByIdUseCase,
        super(const MovieDetailsState()) {
    on<GetMovie>(_onGetMovie);
    on<ShowMovieInfo>(_onShowMovieInfo);
  }

  Future<void> _onGetMovie(GetMovie event, Emitter<MovieDetailsState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getMovieByIdUseCase.execute(event.id);

    if (response is Success && response.data != null) {
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: null,
          errorDescription: null,
          isError: false,
          movie: response.data,
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

  void _onShowMovieInfo(ShowMovieInfo event, Emitter<MovieDetailsState> emit) {
    emit(state._copyWith(showMovieInfo: !state.showMovieInfo));
  }
}
