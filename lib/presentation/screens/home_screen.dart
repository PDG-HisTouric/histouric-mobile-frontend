import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/widgets/widgets.dart';

import '../providers/providers.dart';
import 'routes_temp_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final screens = [
    const CustomGoogleMap(
      initialLat: 3.451929471542798,
      initialLng: -76.5319398863662,
    ),
    const CustomGoogleMap(
      initialLat: 3.451929471542798,
      initialLng: -76.5319398863662,
    ),
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
