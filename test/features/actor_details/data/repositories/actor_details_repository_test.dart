import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/data/repositories/actor_details_repository_impl.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/actor_details_test_helper.mocks.dart';

main() {
  late MockActorDetailsDatasource mockActorDetailsDatasource;
  late ActorDetailsRepositoryImpl actorDetailsRepositoryImpl;

  setUp(() {
    mockActorDetailsDatasource = MockActorDetailsDatasource();
    actorDetailsRepositoryImpl = ActorDetailsRepositoryImpl(actorDetailsDatasource: mockActorDetailsDatasource);
  });

  const testActorDetailsEntity = ActorDetails(
    id: 1024722,
    name: 'Annalise Basso',
    biography:
        "Annalise Basso (born December 2, 1998) is an American film and television actress and model. Her older siblings, Alexandria and Gabriel Basso are also actors.\n\nAnnalise was born into the Basso acting family. She is the youngest child of Marcie Basso and has an older brother and sister; Gabriel and Alexandria. Most of her initial roles have been on television commercials or small one time roles on different shows. Her first role that caught the attention of people was her role as Eden Hamby on True Blood. In 2009, she played a main role in the TV movie Love Takes Wing from the Love Comes Softly series. When she was 10, she took part in the Are You Smarter Than a 5th Grader? where she played one of the students. More recently she has had major roles in episodes of New Girl and Nikita. Basso's first lead role in a feature film is in D.J. Caruso's Standing Up, a coming of age flick based on a book by Brock Cole called The Goats, which debuted at the 2012 Cannes Film Festival. The story centers on two children, played by Basso and Chandler Canterbury, who are stripped naked and left stranded together on an island as part of a summercamp prank.",
    profilePath: 'https://image.tmdb.org/t/p/w500/42AgzcbVBh72j0OwP04SkA4MBz2.jpg',
    popularity: 16.384,
  );

  const actorIdTest = 1024722;

  group('get current actor details', () {
    test('should return current actor details when a call to datasource is success', () async {
      when(mockActorDetailsDatasource.getActorDetailsById(actorIdTest))
          .thenAnswer((_) async => Success(testActorDetailsEntity));

      final result = await actorDetailsRepositoryImpl.getActorDetailsById(actorIdTest);
      expect(result.data, equals(Success(testActorDetailsEntity).data));
    });

    test('should return server failure when a call to datasource is unsuccessful', () async {
      when(mockActorDetailsDatasource.getActorDetailsById(actorIdTest)).thenAnswer(
        (_) async => Failure(NetworkError.badResponse),
      );

      final result = await actorDetailsRepositoryImpl.getActorDetailsById(actorIdTest);
      expect(result.error, equals(Failure(NetworkError.badResponse).error));
    });

    test('should return server failure when the device connection error', () async {
      when(mockActorDetailsDatasource.getActorDetailsById(actorIdTest)).thenAnswer(
            (_) async => Failure(NetworkError.connectionTimeout),
      );

      final result = await actorDetailsRepositoryImpl.getActorDetailsById(actorIdTest);
      expect(result.error, equals(Failure(NetworkError.connectionTimeout).error));
    });
  });
}
