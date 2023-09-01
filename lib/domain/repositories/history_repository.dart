import '../entities/entities.dart';

abstract class HistoryRepository {
  Future<History> getHistoryById(String historyId);
  Future<History> getHistory(String historyId);
}
