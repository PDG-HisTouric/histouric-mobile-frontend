import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../repositories/history_repository_provider.dart';

typedef GetHistoriesByTitleCallback = Future<List<Story>> Function(
    String title);
typedef GetHistoriesCallback = Future<List<Story>> Function();

class HistoriesMapNotifier extends StateNotifier<(List<Story>, bool)> {
  final GetHistoriesByTitleCallback _getHistoriesByTitle;
  final GetHistoriesCallback _getHistories;

  HistoriesMapNotifier(this._getHistoriesByTitle, this._getHistories)
      : super(([], false));

  Future<void> getHistoriesByTitle(String title) async {
    if (title.isEmpty) {
      getHistories();
      return;
    }
    state = (state.$1, true);
    final histories = await _getHistoriesByTitle(title);
    state = (histories, false);
  }

  Future<void> getHistories() async {
    print("desde el provider antes de buscar histories 1");
    state = (state.$1, true);
    print("desde el provider antes de buscar histories 2");
    final histories = await _getHistories();
    print("desde el provider histories: ${histories.length}");
    state = (histories, false);
  }
}

final historiesInfoProvider =
    StateNotifierProvider<HistoriesMapNotifier, (List<Story>, bool)>((ref) {
  final getHistoriesByTitle =
      ref.watch(historyRepositoryProvider).getHistoriesByTitle;
  final getHistories = ref.watch(historyRepositoryProvider).getHistories;
  return HistoriesMapNotifier(getHistoriesByTitle, getHistories);
});
