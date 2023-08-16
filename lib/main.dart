import 'package:flutter/material.dart';
import 'package:histouric_mobile_frontend/presentation/widgets/custom_google_map.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CustomGoogleMap(initialLat: 3.341571, initialLng: -76.530198),
      ),
    );
  }
}
