import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

const String bicScreenPath = 'bic';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
          path: '$bicScreenPath/:bicId',
          builder: (context, state) {
            final bicId = state.pathParameters['bicId'] ?? 'no-id';
            return BICScreen(bicId: bicId);
          },
        ),
      ],
    ),
  ],
);
