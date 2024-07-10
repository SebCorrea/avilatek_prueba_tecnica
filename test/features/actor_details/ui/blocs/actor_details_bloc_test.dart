import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/errors_extension.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/ui/blocs/actor_details_bloc/actor_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/actor_details_test_helper.mocks.dart';

void main() {
  late MockGetActorDetailsByIdUseCase mockGetActorDetailsByIdUseCase;
  late ActorDetailsBloc actorDetailsBloc;

  setUp(() {
    mockGetActorDetailsByIdUseCase = MockGetActorDetailsByIdUseCase();
    actorDetailsBloc = ActorDetailsBloc(getActorDetailsByIdUseCase: mockGetActorDetailsByIdUseCase);
  });

  const testActorDetailsEntity = ActorDetails(
    id: 1024722,
    name: 'Annalise Basso',
    biography:
        "Annalise Basso (born December 2, 1998) is an American film and television actress and model. Her older siblings, Alexandria and Gabriel Basso are also actors.\n\nAnnalise was born into the Basso acting family. She is the youngest child of Marcie Basso and has an older brother and sister; Gabriel and Alexandria. Most of her initial roles have been on television commercials or small one time roles on different shows. Her first role that caught the attention of people was her role as Eden Hamby on True Blood. In 2009, she played a main role in the TV movie Love Takes Wing from the Love Comes Softly series. When she was 10, she took part in the Are You Smarter Than a 5th Grader? where she played one of the students. More recently she has had major roles in episodes of New Girl and Nikita. Basso's first lead role in a feature film is in D.J. Caruso's Standing Up, a coming of age flick based on a book by Brock Cole called The Goats, which debuted at the 2012 Cannes Film Festival. The story centers on two children, played by Basso and Chandler Canterbury, who are stripped naked and left stranded together on an island as part of a summercamp prank.",
    profilePath: 'https://image.tmdb.org/t/p/w500/42AgzcbVBh72j0OwP04SkA4MBz2.jpg',
    popularity: 16.384,
  );

  test('initial state is empty', () {
    expect(actorDetailsBloc.state, const ActorDetailsState());
  });

  blocTest<ActorDetailsBloc, ActorDetailsState>(
    'Should emit loading and loaded state when data is gotten successful',
    build: () {
      when(
        mockGetActorDetailsByIdUseCase.execute(testActorDetailsEntity.id),
      ).thenAnswer((_) async => Success(testActorDetailsEntity));
      return actorDetailsBloc;
    },
    act: (bloc) => bloc.add(GetActorDetails(testActorDetailsEntity.id)),
    expect: () => <ActorDetailsState>[
      const ActorDetailsState(isLoading: true),
      const ActorDetailsState(
        isLoading: false,
        errorTitle: null,
        errorDescription: null,
        isError: false,
        actor: testActorDetailsEntity,
      )
    ],
  );


  blocTest<ActorDetailsBloc, ActorDetailsState>(
    'Should emit loading and failure state when get data is successful',
    build: () {
      when(
        mockGetActorDetailsByIdUseCase.execute(testActorDetailsEntity.id),
      ).thenAnswer((_) async => Failure(NetworkError.connectionError));
      return actorDetailsBloc;
    },
    act: (bloc) => bloc.add(GetActorDetails(testActorDetailsEntity.id)),
    expect: () => <ActorDetailsState>[
      const ActorDetailsState(isLoading: true),
      ActorDetailsState(
        isLoading: false,
        errorTitle: NetworkError.connectionError.errorTitle,
        errorDescription: NetworkError.connectionError.errorDescription,
        isError: true,
      )
    ],
  );
}
