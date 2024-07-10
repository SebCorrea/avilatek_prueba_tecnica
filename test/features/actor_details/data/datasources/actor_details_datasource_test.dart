import 'dart:convert';

import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/data/datasources/actor_details_datasource_impl.dart';
import 'package:avilatek_prueba_tecnica/features/actor_details/domain/entities/actor_details.dart';
import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../helper/json_reader.dart';

void main() {
  late ActorDetailsDatasourceImpl actorDetailsDatasourceImpl;

  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;

  setUp(() {
    actorDetailsDatasourceImpl = ActorDetailsDatasourceImpl(dio: dio);
  });

  const int testId = 1024722;
  final Map<String, dynamic> jsonMap = json.decode(readJson('helper/dummy_data/dummy_actor_details_response.json'));

  group('get current actor detail', () {
    test('should return actorDetail entity when the response conde is 200', () async {
      dioAdapter.onGet(
        '/person/$testId',
        (server) => server.reply(200, jsonMap),
      );

      final result = await actorDetailsDatasourceImpl.getActorDetailsById(testId);

      expect(result.data, isA<ActorDetails>());
    });

    test('should throw a server exception when the response code is 404 or other', () async {
      dioAdapter.onGet(
        '/person/$testId',
        (server) => server.throws(
          404,
          DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionError,
          ),
        ),
      );

      final result = await actorDetailsDatasourceImpl.getActorDetailsById(testId);

      expect(result.error, isA<DataError>());
    });
  });
}
