import '../entities/entities.dart';

abstract class HistoryDataSource {
  Future<History> getHistoryById(String historyId);
  Future<History> getHistory(String historyId);
}
