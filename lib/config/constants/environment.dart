import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String googleDriveApiKey = dotenv.env['GOOGLE_DRIVE_API_KEY']!;
}
