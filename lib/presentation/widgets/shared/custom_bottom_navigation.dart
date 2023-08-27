import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      selectedItemColor: colors.primary,
      currentIndex: 1,
      backgroundColor: const Color(0xFFCFAF86),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_edu_outlined),
          label: 'Historias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_outlined),
          label: 'Rutas',
        ),
      ],
    );
  }
}
