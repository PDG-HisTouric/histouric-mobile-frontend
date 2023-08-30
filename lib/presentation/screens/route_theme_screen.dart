import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histouric_mobile_frontend/config/config.dart';

import '../widgets/widgets.dart';

class RouteThemeScreen extends StatelessWidget {
  final String routeThemeId;
  const RouteThemeScreen({super.key, required this.routeThemeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7C18B),
      appBar: AppBar(
        title: const Text('Rutas'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/$routeScreenPath/1');
              },
              child: GeneralCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Ruta de prueba',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
