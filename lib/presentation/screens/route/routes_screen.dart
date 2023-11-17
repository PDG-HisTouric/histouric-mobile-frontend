import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:histouric_mobile_frontend/config/config.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

import '../../widgets/widgets.dart';

class RoutesScreen extends ConsumerStatefulWidget {
  const RoutesScreen({super.key});

  @override
  ConsumerState<RoutesScreen> createState() => _RouteThemeScreenState();
}

class _RouteThemeScreenState extends ConsumerState<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    final (simpleRoutes, areRoutesLoading) =
        ref.watch(simpleRoutesInfoProvider);

    if (areRoutesLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE7C18B),
      appBar: AppBar(
        title: Text("Rutas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: simpleRoutes
              .map(
                (route) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/$routeScreenPath/${route.id}');
                    },
                    child: GeneralCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                route.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                route.description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
