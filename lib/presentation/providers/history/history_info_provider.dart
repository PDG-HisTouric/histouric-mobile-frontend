import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../repositories/history_repository_provider.dart';

final historyInfoProvider =
    StateNotifierProvider<HistoryMapNotifier, Map<String, Story>>((ref) {
  final getHistoryById = ref.watch(historyRepositoryProvider).getHistoryById;
  return HistoryMapNotifier(getHistoryById: getHistoryById);
});

typedef GetHistoryCallback = Future<Story> Function(String historyId);

class HistoryMapNotifier extends StateNotifier<Map<String, Story>> {
  final GetHistoryCallback getHistoryById;

  HistoryMapNotifier({required this.getHistoryById}) : super({});

  Future<void> loadHistory(String historyId) async {
    if (state[historyId] != null) return;
    final history = await getHistoryById(historyId);

    state = {...state, historyId: history};
  }
}
