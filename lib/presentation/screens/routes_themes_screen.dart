import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class RouteThemeScreen extends ConsumerStatefulWidget {
  const RouteThemeScreen({super.key});

  @override
  ConsumerState<RouteThemeScreen> createState() => _RouteThemeScreenState();
}

class _RouteThemeScreenState extends ConsumerState<RouteThemeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(routesThemesInfoProvider.notifier).loadRoutesThemes();
  }

  @override
  Widget build(BuildContext context) {
    final routesThemes = ref.watch(routesThemesInfoProvider);

    if (routesThemes == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Theme'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: routesThemes!.length,
          itemBuilder: (context, index) {
            return Title(
              color: Colors.black,
              child: Text(
                routesThemes[index].name,
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
