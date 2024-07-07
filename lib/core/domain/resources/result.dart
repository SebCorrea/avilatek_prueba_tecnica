import '../errors/error.dart';

abstract class Result<T, E extends Error> {
  final T? data;
  final E? error;

  Result({
    this.data,
    this.error,
  });
}

class Success<T, E extends Error> extends Result<T, E> {
  Success(T data) : super(data: data);
}

class Failure<T, E extends Error> extends Result<T, E> {
  Failure(E error) : super(error: error);
}
