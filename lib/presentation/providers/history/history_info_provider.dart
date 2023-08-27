import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/domain/entities/history.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

final historyInfoProvider =
    StateNotifierProvider<HistoryMapNotifier, Map<String, History>>((ref) {
  final getHistory = ref.watch(historyRepositoryProvider).getHistoryById;
  return HistoryMapNotifier(getHistory: getHistory);
});

typedef GetHistoryCallback = Future<History> Function(String historyId);

class HistoryMapNotifier extends StateNotifier<Map<String, History>> {
  final GetHistoryCallback getHistory;

  HistoryMapNotifier({required this.getHistory}) : super({});

  Future<void> loadHistory(String historyId) async {
    if (state[historyId] != null) return;
    final history = await getHistory(historyId);

    state = {...state, historyId: history};
  }
}
