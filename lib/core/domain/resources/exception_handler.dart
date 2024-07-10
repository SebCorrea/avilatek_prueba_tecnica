import '../errors/data_error.dart';

/// Clase abstracta que define la interfaz para manejadores de excepciones.
///
/// Esta clase genérica toma un tipo de excepción [T] que extiende [Exception]
/// y proporciona un método abstracto `handle()` que debe ser implementado por
/// las clases concretas de manejadores de excepciones para manejar la excepción
/// y devolver un [DataError] correspondiente.
abstract class ExceptionHandler<T extends Exception> {
  DataError handle(T error);
}
