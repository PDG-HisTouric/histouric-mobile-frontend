import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histouric_mobile_frontend/config/config.dart';

class RoutesTempScreen extends StatelessWidget {
  const RoutesTempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: _GeneralCard(
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

class _GeneralCard extends StatelessWidget {
  final Widget child;

  const _GeneralCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Altura de la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Radio de borde redondeado
      ),
      child: child,
    );
  }
}
