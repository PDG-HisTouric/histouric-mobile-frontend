import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

import '../../../domain/entities/entities.dart';

typedef GetSimpleRoutesCallback = Future<List<SimpleRoute>> Function();

class SimpleRoutesNotifier extends StateNotifier<List<SimpleRoute>> {
  final GetSimpleRoutesCallback getSimpleRoutesCallback;

  SimpleRoutesNotifier(this.getSimpleRoutesCallback) : super([]);

  Future<void> loadSimpleRoutes() async {
    state = await getSimpleRoutesCallback();
  }
}

final simpleRoutesInfoProvider =
    StateNotifierProvider<SimpleRoutesNotifier, List<SimpleRoute>>((ref) {
  final getSimpleRoutesCallback =
      ref.watch(routeRepositoryProvider).getSimplifiedRoutes;
  return SimpleRoutesNotifier(getSimpleRoutesCallback);
});
