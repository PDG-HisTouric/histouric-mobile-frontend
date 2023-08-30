import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_repository_provider.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_theme_repository_provider.dart';

import '../../../domain/entities/entities.dart';

typedef GetRoutesThemesCallback = Future<List<RouteTheme>> Function();

class RouteThemeNotifier extends StateNotifier<List<RouteTheme>?> {
  final GetRoutesThemesCallback getRoutesThemesCallback;

  RouteThemeNotifier({required this.getRoutesThemesCallback}) : super(null);

  Future<void> loadRoutesThemes() async {
    state = await getRoutesThemesCallback();
  }
}

final routesThemesInfoProvider =
    StateNotifierProvider<RouteThemeNotifier, List<RouteTheme>?>((ref) {
  final getRoutesThemesCallback =
      ref.watch(routeThemeRepositoryProvider).getRouteThemes;
  return RouteThemeNotifier(getRoutesThemesCallback: getRoutesThemesCallback);
});
