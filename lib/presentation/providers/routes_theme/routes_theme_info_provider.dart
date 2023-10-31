import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_repository_provider.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_theme_repository_provider.dart';

import '../../../domain/entities/entities.dart';

typedef GetRoutesThemesCallback = Future<List<RouteTheme>> Function();

class RoutesThemesNotifier extends StateNotifier<List<RouteTheme>?> {
  final GetRoutesThemesCallback getRoutesThemesCallback;

  RoutesThemesNotifier({required this.getRoutesThemesCallback}) : super(null);

  Future<void> loadRoutesThemes() async {
    state = await getRoutesThemesCallback();
  }
}

final routesThemesInfoProvider =
    StateNotifierProvider<RoutesThemesNotifier, List<RouteTheme>?>((ref) {
  final getRoutesThemesCallback =
      ref.watch(routeThemeRepositoryProvider).getRouteThemes;
  return RoutesThemesNotifier(getRoutesThemesCallback: getRoutesThemesCallback);
});

typedef GetRoutesThemeByIdCallback = Future<RouteTheme> Function(
    String routeThemeId);

class RoutesThemeNotifier extends StateNotifier<RouteTheme?> {
  final GetRoutesThemeByIdCallback getRoutesThemeByIdCallback;

  RoutesThemeNotifier({required this.getRoutesThemeByIdCallback}) : super(null);

  Future<void> loadRoutesThemeById(String routeThemeId) async {
    state = await getRoutesThemeByIdCallback(routeThemeId);
  }
}

final routesThemeInfoProvider =
    StateNotifierProvider<RoutesThemeNotifier, RouteTheme?>((ref) {
  final getRoutesThemeByIdCallback =
      ref.watch(routeThemeRepositoryProvider).getRouteThemeById;
  return RoutesThemeNotifier(
    getRoutesThemeByIdCallback: getRoutesThemeByIdCallback,
  );
});
