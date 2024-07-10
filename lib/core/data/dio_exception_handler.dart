import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:dio/dio.dart';

import '../domain/resources/exception_handler.dart';

/// Manejador de excepciones para errores de Dio.
///
/// Esta clase extiende `ExceptionHandler` y maneja específicamente excepciones/// de tipo `DioException
/// `, traduciéndolas a errores de red de tipo `NetworkError`.
class DioExceptionHandler extends ExceptionHandler<DioException> {
  /// Maneja una excepción de Dio y devuelve un error de red correspondiente.
  ///
  /// [error] La excepción de Dio a manejar
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
