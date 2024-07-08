import 'dart:async';

import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/resources/result.dart';
import '../../../../movies/domain/entities/movie.dart';
import '../../../domain/usecases/get_actor_details_by_id_usecase.dart';

part 'actor_details_event.dart';

part 'actor_details_state.dart';

class ActorDetailsBloc extends Bloc<ActorDetailsEvent, ActorDetailsState> {
  final GetActorDetailsByIdUseCase _getActorDetailsByIdUseCase;

  ActorDetailsBloc({required GetActorDetailsByIdUseCase getActorDetailsByIdUseCase})
      : _getActorDetailsByIdUseCase = getActorDetailsByIdUseCase,
        super(const ActorDetailsState()) {
    on<GetActorDetails>(_onGetActorDetails);
  }

  Future<void> _onGetActorDetails(GetActorDetails event, Emitter<ActorDetailsState> emit) async {
    emit(
      state._copyWith(
        isLoading: true,
      ),
    );

    final response = await _getActorDetailsByIdUseCase.execute(event.actorId);

    if (response is Success && response.data != null) {
      emit(
        state._copyWith(
          isLoading: false,
          errorTitle: null,
          errorDescription: null,
          isError: false,
          actor: response.data,
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
