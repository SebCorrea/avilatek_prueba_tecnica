class ImgPaths {
  ImgPaths._();

  static const String _imagesBasePath = 'assets/images';
  static const String userImg = '$_imagesBasePath/sebastian_correa_img.webp';
}

/// Clase que define las URLs de las imágenes de red utilizadas en la aplicación.
class NetworkImagesUrls {
  NetworkImagesUrls._();

  /// URL de una imagen para películas sin póster.
  static const String noPosterMovieUrl = 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg';
  /// URL de una imagen para usuarios sin imagen de perfil.
  static const String noUserImageUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
}
