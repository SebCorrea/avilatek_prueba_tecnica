/// Clase que define los nombres de las variables de entorno utilizados en la aplicación.
///
/// Esta clase porporciona constantes para cada variable de entorno, lo que facilita su uso y mantenimiento
///
/// **Importante** el valor asignado a la variable debe coincidir exactamente con el nombre de la variable de entorno
/// almacenada en el .env
class Environment {
  Environment._();

  static const String movieDBApiKey = 'MOVIE_DB_API_KEY';
}
