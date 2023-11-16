import '../../domain/domain.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryDataSource historyDataSource;

  HistoryRepositoryImpl(this.historyDataSource);

  @override
  Future<Story> getHistoryById(String historyId) {
    return historyDataSource.getHistoryById(historyId);
  }

  @override
  Future<List<Story>> getHistoriesByTitle(String title) {
    return historyDataSource.getHistoriesByTitle(title);
  }

  @override
  Future<List<Story>> getHistories() {
    return historyDataSource.getHistories();
  }
}
