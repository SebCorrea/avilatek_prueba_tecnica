import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/usecases/get_actor_details_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/actor_details_test_helper.mocks.dart';

void main() {
  late GetActorDetailsByIdUseCase getActorDetailsByIdUseCase;
  late MockActorDetailsRepository mockActorDetailsRepository;

  setUp(() {
    mockActorDetailsRepository = MockActorDetailsRepository();
    getActorDetailsByIdUseCase = GetActorDetailsByIdUseCase(actorDetailsRepository: mockActorDetailsRepository);
  });

  const testActorDetail = ActorDetails(
    id: 23343,
    name: 'Sebastian Correa',
    biography: 'Una biografia cualquiera',
    profilePath: '',
    popularity: 7.8,
  );
  const testId = 23343;
  test('show get actor details from the repository', () async {
    when(
      mockActorDetailsRepository.getActorDetailsById(testId),
    ).thenAnswer((answer) async => Success(testActorDetail));

    final result = await getActorDetailsByIdUseCase.execute(testId);
    expect(result, isA<Success>());
    expect(result.data, testActorDetail);
  });
}
