import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final bottomNavigationBarIndex =
        ref.watch(bottomNavigationBarIndexProvider);

    return BottomNavigationBar(
      selectedItemColor: colors.primary,
      currentIndex: bottomNavigationBarIndex,
      onTap: (index) {
        ref.read(bottomNavigationBarIndexProvider.notifier).state = index;
        if (index == 0) {
          ref.read(historiesInfoProvider.notifier).getHistories();
        }
        if (index == 2) {
          ref.read(simpleRoutesInfoProvider.notifier).loadSimpleRoutes();
        }
      },
      backgroundColor: colors.surface,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.history_edu_outlined),
          label: 'Historias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'BICs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_outlined),
          label: 'Rutas',
        ),
      ],
    );
  }
}
