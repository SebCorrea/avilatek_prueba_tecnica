import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/actors/domain/entities/actor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../domain/usecases/get_actor_by_movie_id_usecase.dart';

part 'actors_event.dart';

part 'actors_state.dart';

class ActorsBloc extends Bloc<ActorsEvent, ActorsState> {
  final GetActorByMovieIdUseCase _getActorByMovieIdUseCase;

  ActorsBloc({required GetActorByMovieIdUseCase getActorByMovieIdUseCase})
      : _getActorByMovieIdUseCase = getActorByMovieIdUseCase,
        super(const ActorsState()) {
    on<GetActors>(_onGetActor);
  }

  Future<void> _onGetActor(GetActors event, Emitter<ActorsState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getActorByMovieIdUseCase.execute(event.movieId);

    if (response is Success && response.data != null) {
      print(response.data!.first.name);
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: null,
          errorDescription: null,
          isError: false,
          actors: response.data,
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
