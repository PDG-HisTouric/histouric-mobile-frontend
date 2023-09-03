import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:histouric_mobile_frontend/config/config.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

import '../widgets/widgets.dart';

class RouteThemeScreen extends ConsumerStatefulWidget {
  final String routeThemeId;
  const RouteThemeScreen({super.key, required this.routeThemeId});

  @override
  ConsumerState<RouteThemeScreen> createState() => _RouteThemeScreenState();
}

class _RouteThemeScreenState extends ConsumerState<RouteThemeScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.routeThemeId);
    ref
        .read(routesThemeInfoProvider.notifier)
        .loadRoutesThemeById(widget.routeThemeId);
  }

  @override
  Widget build(BuildContext context) {
    final RoutesTheme? routesTheme = ref.watch(routesThemeInfoProvider);

    if (routesTheme == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE7C18B),
      appBar: AppBar(
        title: Text(routesTheme!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: routesTheme.routes
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
                          child: Text(
                            textAlign: TextAlign.center,
                            route.name,
                            style: Theme.of(context).textTheme.bodyLarge,
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
