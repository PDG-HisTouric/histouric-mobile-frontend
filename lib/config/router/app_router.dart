import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
  ],
);
