import '../../domain/domain.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryDataSource historyDataSource;

  HistoryRepositoryImpl(this.historyDataSource);

  @override
  Future<History> getHistoryById(String historyId) {
    return historyDataSource.getHistoryById(historyId);
  }
}
