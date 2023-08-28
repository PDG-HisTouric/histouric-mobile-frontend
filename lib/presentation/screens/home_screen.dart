import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final screens = [
    const CustomGoogleMap(initialLat: 3.341571, initialLng: -76.530198),
    const CustomGoogleMap(initialLat: 3.341571, initialLng: -76.530198),
    const RoutesTempScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationBarIndex =
        ref.watch(bottomNavigationBarIndexProvider);

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: bottomNavigationBarIndex,
          children: screens,
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }
}
