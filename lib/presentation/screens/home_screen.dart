import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomGoogleMap(initialLat: 3.341571, initialLng: -76.530198),
          ],
        ),
      ),
    );
  }
}
