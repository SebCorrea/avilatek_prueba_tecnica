import '../errors/error.dart';

/// Clase abstracta que representa el resultado de una operación.
///
/// Esta clase genérica toma dos tipos: [T] para el tipo de datos en caso de éxito
/// y [E] para el tipo de error en caso de fallo. El resultado puede contener
/// datos o un error,pero no ambos.
abstract class Result<T, E extends Error> {
  /// Los datos devueltos en caso de éxito.
  final T? data;
  /// El error devuelto en caso de fallo.
  final E? error;

  Result({
    this.data,
    this.error,
  });
}

/// Clase que representa un resultado exitoso.
///
/// Contiene los datos devueltos por la operación.
class Success<T, E extends Error> extends Result<T, E> {
  Success(T data) : super(data: data);
}

/// Clase que representa un resultado fallido.
///
/// Contiene el error que ocurrió durante la operación.
class Failure<T, E extends Error> extends Result<T, E> {
  Failure(E error) : super(error: error);
}
