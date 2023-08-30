import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class RoutesThemesScreen extends ConsumerStatefulWidget {
  const RoutesThemesScreen({super.key});

  @override
  ConsumerState<RoutesThemesScreen> createState() => _RouteThemeScreenState();
}

class _RouteThemeScreenState extends ConsumerState<RoutesThemesScreen> {
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
      backgroundColor: const Color(0xFFE7C18B),
      appBar: AppBar(
        title: const Text('Temáticas'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: routesThemes
                  .map(
                    (routeTheme) => GestureDetector(
                      onTap: () {
                        context.push('/$routeThemeScreenPath/${routeTheme.id}');
                      },
                      child: GeneralCard(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 150,
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                routeTheme.name,
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
        ),
      ),
    );
  }
}
