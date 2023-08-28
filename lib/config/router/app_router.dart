import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

const String bicScreenPath = 'bic';
const String historyScreenPath = 'history';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => HomeScreen(),
    ),
    GoRoute(
      path: '/$bicScreenPath/:bicId',
      builder: (context, state) {
        final bicId = state.pathParameters['bicId'] ?? 'no-id';
        return BICScreen(bicId: bicId);
      },
    ),
    GoRoute(
      path: '/$historyScreenPath/:historyId',
      builder: (context, state) {
        final historyId = state.pathParameters['historyId'] ?? 'no-id';
        return HistoryScreen(historyId: historyId);
      },
    ),
  ],
);
