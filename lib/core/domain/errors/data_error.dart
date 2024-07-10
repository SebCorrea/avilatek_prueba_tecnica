import '../errors/error.dart';

/// Sealed class que representa un error de datos.
///
/// Esta clase sirve como una clase base para todos los errores de datos en la aplicación.
sealed class DataError implements Error {}

/// Enumeración que representa diferentes tipos de errores de red.
///
/// Cada valor de la enumeración representa un tipo específico de error de red,
/// como un tiempo de espera de conexión o una mala respuesta.
///
/// Todos los erroresde red implementan la interfaz `DataError`.
enum NetworkError implements DataError {
  unknown,
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
}
