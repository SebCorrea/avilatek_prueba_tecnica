import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';

extension DataErrorMessages on DataError {
  String get errorMessage => switch (this) {
        NetworkError.unknown => UIStrings.unknown,
        NetworkError.connectionTimeout => UIStrings.connectionTimeout,
        NetworkError.sendTimeout => UIStrings.sendTimeout,
        NetworkError.receiveTimeout => UIStrings.receiveTimeout,
        NetworkError.badCertificate => UIStrings.badCertificate,
        NetworkError.badResponse => UIStrings.badResponse,
        NetworkError.cancel => UIStrings.cancel,
        NetworkError.connectionError => UIStrings.connectionError,
      };
}
