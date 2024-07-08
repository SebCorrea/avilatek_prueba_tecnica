import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../../movies/domain/entities/movie.dart';
import '../../../../movies/domain/usecases/get_movies_by_actor_id.dart';

part 'movies_actor_event.dart';

part 'movies_actor_state.dart';

class MoviesActorBloc extends Bloc<MoviesActorEvent, MoviesActorState> {
  final GetMoviesByActorIdUseCase _getMoviesByActorIdUseCase;

  MoviesActorBloc({required GetMoviesByActorIdUseCase getMoviesByActorIdUseCase})
      : _getMoviesByActorIdUseCase = getMoviesByActorIdUseCase,
        super(const MoviesActorState()) {
    on<GetMoviesByActorId>(_onGetMoviesByActorId);
  }

  Future<void> _onGetMoviesByActorId(GetMoviesByActorId event, Emitter<MoviesActorState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getMoviesByActorIdUseCase.execute(event.actorId);

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
}
