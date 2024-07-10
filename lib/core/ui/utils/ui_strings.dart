/// Clase que define las cadenas de texto utilizadas en la interfaz de usuario de la aplicación.
class UIStrings {
  UIStrings._();

  static replaceUIString(String message, String value) => message.replaceAll('%d', value);

  /*General*/
  static const String cancelLabel = 'Cancelar';
  static const String searchLabel = 'Buscar';
  static const String emptyResultsMessage =
      'No encontramos lo que buscas, mira estos otros títulos o prueba con otra búsqueda.';

  /*User*/
  static const String name = 'Sebastián Correa';
  static const String email = 'sebcorrea992@gmail.com';

  /*Menu Labels*/
  static const String home = 'Inicio';
  static const String topRated = 'Mejor calificadas';
  static const String configuration = 'Configuración';

  /*Config Screen*/
  static const String theme = 'Tema';
  static const String dark = 'Oscuro';
  static const String light = 'Claro';

  /*Error Titles*/
  static const String unknownErrorTitle = 'Ups, algo salió mal';
  static const String connectionTimeoutErrorTitle = 'Tiempo de conexión agotado';
  static const String sendTimeoutErrorTitle = 'No se pudo completar tu solicitud';
  static const String receiveTimeoutErrorTitle = 'No se pudo completar tu solicitud';
  static const String badCertificateErrorTitle = 'El certificado de seguridad del servidor no es válido';
  static const String badResponseErrorTitle = 'No se pudo completar la solicitud';
  static const String cancelErrorTitle = 'Solicitud cancelada';
  static const String connectionErrorTitle = 'Revisa tu conexión';

  /*Error Descriptions*/
  static const String unknownErrorDescription = 'Por favor, inténtalo de nuevo más tarde';
  static const String connectionTimeoutErrorDescription =
      'Por favor, verifica tu conexión a internet e inténtalo de nuevo';
  static const String sendTimeoutErrorDescription = 'Por favor, verifica tu conexión a internet e inténtalo de nuevo';
  static const String receiveTimeoutErrorDescription =
      'Por favor, verifica tu conexión a internet e inténtalo de nuevo';
  static const String badCertificateErrorDescription = 'Por favor, contacta con el administrador del sitio web';
  static const String badResponseErrorDescription = 'Se ha recibido una respuesta inesperada del servidor';
  static const String cancelErrorDescription = 'Por favor, inténtalo de nuevo más tarde';
  static const String connectionErrorDescription = 'No se pudo establecer conexión con el servidor';

  /*Movies*/
  static const String userScoreLabel = '%d% User Score';
  static const String loadMoviesErrorMessage = 'Error al cargar las películas';

  /*Actors*/
  static const String actorLabel = 'Actor';
  static const String castedOnLabel = 'Participó en';
  static const String loadActorErrorMessage = 'Error al cargar actor';
  static const String noBiographyMessage = 'Este actor no cuenta con biografía...';
}
