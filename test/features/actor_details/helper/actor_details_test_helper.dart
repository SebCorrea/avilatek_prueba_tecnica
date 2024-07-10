import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/repositories/actor_details_repository.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/usecases/get_actor_details_by_id_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ActorDetailsRepository,
    ActorDetailsDatasource,
    GetActorDetailsByIdUseCase,
  ],
)
void main() {}
