import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

/// Un widget que muestra un mensaje de error con un icono, un título y una descripción.
///
/// [title] El título del mensaje de error
///
/// [description] La descripción del error
class ErrorMessage extends StatelessWidget {
  final String title;
  final String description;

  const ErrorMessage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colorScheme.error,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const _IconError(),
          const SizedBox(
            width: 16.0,
          ),
          Flexible(child: _ErrorInfo(title: title, description: description)),
        ],
      ),
    );
  }
}

class _ErrorInfo extends StatelessWidget {
  final String title;
  final String description;

  const _ErrorInfo({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.outlineVariant),
          maxLines: 3,
        )
      ],
    );
  }
}

class _IconError extends StatelessWidget {
  const _IconError();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.warning_amber_rounded,
      size: 40,
      color: context.colorScheme.error,
    );
  }
}
