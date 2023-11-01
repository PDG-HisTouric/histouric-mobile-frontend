import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String googleDriveApiKey = dotenv.env['GOOGLE_DRIVE_API_KEY']!;
  static String directionsApiKey = dotenv.env['DIRECTIONS_API_KEY']!;
  static String baseUrl = const String.fromEnvironment('BASE_URL',
      defaultValue: 'BASE_URL not found');
}
