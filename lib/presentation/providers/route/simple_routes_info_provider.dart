import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

import '../../../domain/entities/entities.dart';

typedef GetSimpleRoutesCallback = Future<List<SimpleRoute>> Function();

class SimpleRoutesNotifier extends StateNotifier<(List<SimpleRoute>, bool)> {
  final GetSimpleRoutesCallback getSimpleRoutesCallback;

  SimpleRoutesNotifier(this.getSimpleRoutesCallback) : super(([], false));

  Future<void> loadSimpleRoutes() async {
    state = (state.$1, true);
    final routes = await getSimpleRoutesCallback();
    state = (routes, false);
  }
}

final simpleRoutesInfoProvider =
    StateNotifierProvider<SimpleRoutesNotifier, (List<SimpleRoute>, bool)>(
        (ref) {
  final getSimpleRoutesCallback =
      ref.watch(routeRepositoryProvider).getSimplifiedRoutes;
  return SimpleRoutesNotifier(getSimpleRoutesCallback);
});
