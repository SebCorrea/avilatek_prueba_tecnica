import 'package:avilatek_prueba_tecnica/core/domain/errors/data_error.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';

extension DataErrorMessages on DataError {
  String get errorDescription => switch (this) {
        NetworkError.unknown => UIStrings.unknownErrorDescription,
        NetworkError.connectionTimeout => UIStrings.connectionTimeoutErrorDescription,
        NetworkError.sendTimeout => UIStrings.sendTimeoutErrorDescription,
        NetworkError.receiveTimeout => UIStrings.receiveTimeoutErrorDescription,
        NetworkError.badCertificate => UIStrings.badCertificateErrorDescription,
        NetworkError.badResponse => UIStrings.badResponseErrorDescription,
        NetworkError.cancel => UIStrings.cancelErrorDescription,
        NetworkError.connectionError => UIStrings.connectionErrorDescription,
      };

  String get errorTitle => switch (this) {
    NetworkError.unknown => UIStrings.unknownErrorTitle,
    NetworkError.connectionTimeout => UIStrings.connectionTimeoutErrorTitle,
    NetworkError.sendTimeout => UIStrings.sendTimeoutErrorTitle,
    NetworkError.receiveTimeout => UIStrings.receiveTimeoutErrorTitle,
    NetworkError.badCertificate => UIStrings.badCertificateErrorTitle,
    NetworkError.badResponse => UIStrings.badResponseErrorTitle,
    NetworkError.cancel => UIStrings.cancelErrorTitle,
    NetworkError.connectionError => UIStrings.connectionErrorTitle,
  };

}
