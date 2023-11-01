import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final screens = [
    const HistoriesScreen(),
    const CustomGoogleMap(
      initialLat: 3.451929471542798,
      initialLng: -76.5319398863662,
    ),
    const RoutesThemesScreen(),
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
