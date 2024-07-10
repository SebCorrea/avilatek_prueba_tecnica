
/// Clase abstracta que define la interfaz para casos de uso.
///
/// Esta clase genérica toma dos tipos: [T] para el tipo de resultado devuelto por el caso de uso
/// y [Params] para el tipo de parámetros que el caso de uso espera.
///
abstract class UseCase<T, Params> {
  /// Ejecuta la lógica de negocio del caso de uso.
  ///
  /// [params] Los parámetros necesarios para ejecutar el caso de uso.
  T execute(Params params);
}
