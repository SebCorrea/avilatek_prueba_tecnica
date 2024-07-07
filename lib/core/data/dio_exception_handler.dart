import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:dio/dio.dart';

import '../domain/resources/exception_handler.dart';

class DioExceptionHandler extends ExceptionHandler<DioException> {
  @override
  DataError handle(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout => NetworkError.connectionTimeout,
      DioExceptionType.sendTimeout => NetworkError.sendTimeout,
      DioExceptionType.receiveTimeout => NetworkError.receiveTimeout,
      DioExceptionType.badCertificate => NetworkError.badCertificate,
      DioExceptionType.badResponse => NetworkError.badResponse,
      DioExceptionType.cancel => NetworkError.cancel,
      DioExceptionType.connectionError => NetworkError.connectionError,
      DioExceptionType.unknown => NetworkError.unknown,
    };
  }
}
