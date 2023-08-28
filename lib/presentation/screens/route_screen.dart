import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RouteScreen extends StatelessWidget {
  final String routeId;

  const RouteScreen({super.key, required this.routeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruta'),
      ),
      body: const CustomGoogleMap(
        initialLat: 3.451929471542798,
        initialLng: -76.5319398863662,
      ),
    );
  }
}
