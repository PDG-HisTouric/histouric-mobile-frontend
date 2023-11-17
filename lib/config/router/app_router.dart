import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

const String bicScreenPath = 'bic';
const String historyScreenPath = 'history';
const String routeThemeScreenPath = 'route-theme';
const String routeScreenPath = 'route';

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
    GoRoute(
      path: '/$routeScreenPath/:routeId',
      builder: (context, state) {
        final routeId = state.pathParameters['routeId'] ?? 'no-id';
        return RouteScreen(routeId: routeId);
      },
    ),
  ],
);
