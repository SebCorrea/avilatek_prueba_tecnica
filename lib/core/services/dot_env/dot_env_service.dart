import 'package:flutter_dotenv/flutter_dotenv.dart';

///Servicio para cargar y acceder a variables de entorno desde un archivo `.env`.
class DotEnvService {
  /// Inicializa el serviciocargando las variables de entorno desde el archivo `.env`.
  static Future<void> init() async => await dotenv.load(fileName: ".env");

  /// Obtiene el valor de una variable de entorno.
  ///
  /// Lanza una excepción si la variable no está configurada enel archivo `.env`.
  ///
  /// [variableName] Es el nombre de la variable de entorno a obtener.
  ///
  /// **Importante** El nombre de la variable de entorno debe guardarse en la clase [Environment] para posteriormente
  /// ser pasada como argumento del método
  static String getEnvVariable(String variableName) {
    final environmentVariable = dotenv.env[variableName];
    if (environmentVariable == null) throw Exception('ENVIRONMENT EXCEPTION: $variableName NOT CONFIGURED');
    return environmentVariable;
  }
}
