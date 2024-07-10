import 'package:flutter/cupertino.dart';

import '../utils/img_paths.dart';
import 'fade_in_animation.dart';

/// Un widget que muestra una imagen de red con manejo de errores y una animación de desvanecimiento.
///
/// [imageUrl] La url de la imagen a mostrar
///
/// [onErrorImageUrl] La URL de la imagen que se mostrará si ocurre un error al cargar [imageUrl].
///
/// [fit] Cómo ajustar la imagen dentro del widget.
class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String onErrorImageUrl;
  final BoxFit? fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    required this.onErrorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          fit: BoxFit.cover,
          NetworkImagesUrls.noPosterMovieUrl,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const SizedBox();
        }
        return FadeInAnimation(child: child);
      },
    );
  }
}
