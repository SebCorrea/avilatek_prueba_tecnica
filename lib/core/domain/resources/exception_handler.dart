import '../errors/data_error.dart';

abstract class ExceptionHandler<T extends Exception> {
  DataError handle(T error);
}
