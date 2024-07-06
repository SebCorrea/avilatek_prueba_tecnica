import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvService {
  static Future<void> init() async => await dotenv.load(fileName: ".env");

  static String getEnvVariable(String variableName) {
    final environmentVariable = dotenv.env[variableName];
    if (environmentVariable == null) throw Exception('ENVIRONMENT EXCEPTION: $variableName NOT CONFIGURED');
    return environmentVariable;
  }
}
