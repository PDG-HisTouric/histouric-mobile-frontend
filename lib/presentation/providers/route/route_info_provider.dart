import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/providers/repositories/route_repository_provider.dart';

import '../../../domain/entities/entities.dart';

typedef GetRouteCallback = Future<HistouricRoute> Function(String bic);

class RouteNotifier extends StateNotifier<HistouricRoute?> {
  final GetRouteCallback getRouteCallback;

  RouteNotifier({required this.getRouteCallback}) : super(null);

  Future<void> loadRoute(String routeId) async {
    state = await getRouteCallback(routeId);
  }
}

final routeInfoProvider =
    StateNotifierProvider<RouteNotifier, HistouricRoute?>((ref) {
  final getRouteCallback = ref.watch(routeRepositoryProvider).getRouteById;
  return RouteNotifier(getRouteCallback: getRouteCallback);
});
