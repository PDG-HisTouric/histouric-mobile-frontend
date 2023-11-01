import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../repositories/history_repository_provider.dart';

final historiesInfoProvider =
    StateNotifierProvider<HistoriesMapNotifier, List<Story>>((ref) {
  final getHistoriesByTitle =
      ref.watch(historyRepositoryProvider).getHistoriesByTitle;
  return HistoriesMapNotifier(getHistoriesByTitle: getHistoriesByTitle);
});

typedef GetHistoriesCallback = Future<List<Story>> Function(String title);

class HistoriesMapNotifier extends StateNotifier<List<Story>> {
  final GetHistoriesCallback getHistoriesByTitle;

  HistoriesMapNotifier({required this.getHistoriesByTitle}) : super([]);

  Future<void> getHistories(String title) async {
    if (title.isEmpty) {
      state = [];
      return;
    }
    final histories = await getHistoriesByTitle(title);
    print(histories.length);
    Future.delayed(const Duration(seconds: 5));
    state = [...histories];
  }
}
