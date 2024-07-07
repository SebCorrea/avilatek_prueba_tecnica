import '../errors/error.dart';

sealed class DataError implements Error {}

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
