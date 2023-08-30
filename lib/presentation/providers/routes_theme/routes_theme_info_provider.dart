import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_repository_provider.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_theme_repository_provider.dart';

import '../../../domain/entities/entities.dart';

typedef GetRoutesThemesCallback = Future<List<RoutesTheme>> Function();

class RoutesThemesNotifier extends StateNotifier<List<RoutesTheme>?> {
  final GetRoutesThemesCallback getRoutesThemesCallback;

  RoutesThemesNotifier({required this.getRoutesThemesCallback}) : super(null);

  Future<void> loadRoutesThemes() async {
    state = await getRoutesThemesCallback();
  }
}

final routesThemesInfoProvider =
    StateNotifierProvider<RoutesThemesNotifier, List<RoutesTheme>?>((ref) {
  final getRoutesThemesCallback =
      ref.watch(routeThemeRepositoryProvider).getRouteThemes;
  return RoutesThemesNotifier(getRoutesThemesCallback: getRoutesThemesCallback);
});

typedef GetRoutesThemeByIdCallback = Future<RoutesTheme> Function(
    String routeThemeId);

class RoutesThemeNotifier extends StateNotifier<RoutesTheme?> {
  final GetRoutesThemeByIdCallback getRoutesThemeByIdCallback;

  RoutesThemeNotifier({required this.getRoutesThemeByIdCallback}) : super(null);

  Future<void> loadRoutesThemeById(String routeThemeId) async {
    state = await getRoutesThemeByIdCallback(routeThemeId);
  }
}

final routesThemeInfoProvider =
    StateNotifierProvider<RoutesThemeNotifier, RoutesTheme?>((ref) {
  final getRoutesThemeByIdCallback =
      ref.watch(routeThemeRepositoryProvider).getRouteThemeById;
  return RoutesThemeNotifier(
    getRoutesThemeByIdCallback: getRoutesThemeByIdCallback,
  );
});
