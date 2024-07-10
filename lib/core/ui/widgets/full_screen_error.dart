import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

/// Un widget que muestra un mensaje de error a pantalla completa con un icono, un título y una descripción.
///
/// [errorMessage] Título del error
///
/// [errorDescription] Descripcion del error
class FullScreenError extends StatelessWidget {
  final String errorMessage;
  final String errorDescription;

  const FullScreenError({super.key, required this.errorMessage, required this.errorDescription});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _FullScreenView(
          errorMessage: errorMessage,
          errorDescription: errorDescription,
        ),
      ),
    );
  }
}

class _FullScreenView extends StatelessWidget {
  final String errorMessage;
  final String errorDescription;

  const _FullScreenView({required this.errorMessage, required this.errorDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const _IconError(),
        const SizedBox(height: 36),
        Text(
          errorMessage,
          style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          errorDescription,
          style: context.textTheme.titleSmall!.copyWith(color: context.colorScheme.outlineVariant),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class _IconError extends StatelessWidget {
  const _IconError();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.error,
          width: 2,
        ),
      ),
      child: Icon(
        Icons.warning_amber,
        size: 40,
        color: context.colorScheme.error,
      ),
    );
  }
}
