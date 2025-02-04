// Mocks generated by Mockito 5.4.4 from annotations
// in avilatek_prueba_tecnica/test/features/actor_details/helper/actor_details_test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart'
    as _i7;
import 'package:avilatek_prueba_tecnica/core/domain/errors/error.dart' as _i1;
import 'package:avilatek_prueba_tecnica/core/domain/resources/result.dart'
    as _i3;
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/datasources/actor_details_datasource.dart'
    as _i8;
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart'
    as _i6;
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/repositories/actor_details_repository.dart'
    as _i4;
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/usecases/get_actor_details_by_id_usecase.dart'
    as _i9;
import 'package:mockito/mockito.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T, E extends _i1.Error> extends _i2.SmartFake
    implements _i3.Result<T, E> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ActorDetailsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockActorDetailsRepository extends _i2.Mock
    implements _i4.ActorDetailsRepository {
  MockActorDetailsRepository() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>> getActorDetailsById(
          int? actorId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActorDetailsById,
          [actorId],
        ),
        returnValue:
            _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>.value(
                _FakeResult_0<_i6.ActorDetails, _i7.DataError>(
          this,
          Invocation.method(
            #getActorDetailsById,
            [actorId],
          ),
        )),
      ) as _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>);
}

/// A class which mocks [ActorDetailsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockActorDetailsDatasource extends _i2.Mock
    implements _i8.ActorDetailsDatasource {
  MockActorDetailsDatasource() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>> getActorDetailsById(
          int? actorId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActorDetailsById,
          [actorId],
        ),
        returnValue:
            _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>.value(
                _FakeResult_0<_i6.ActorDetails, _i7.DataError>(
          this,
          Invocation.method(
            #getActorDetailsById,
            [actorId],
          ),
        )),
      ) as _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>);
}

/// A class which mocks [GetActorDetailsByIdUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetActorDetailsByIdUseCase extends _i2.Mock
    implements _i9.GetActorDetailsByIdUseCase {
  MockGetActorDetailsByIdUseCase() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>> execute(
          int? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>.value(
                _FakeResult_0<_i6.ActorDetails, _i7.DataError>(
          this,
          Invocation.method(
            #execute,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Result<_i6.ActorDetails, _i7.DataError>>);
}
