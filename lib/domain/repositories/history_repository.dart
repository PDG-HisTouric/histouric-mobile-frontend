import '../entities/entities.dart';

abstract class HistoryRepository {
  Future<Story> getHistoryById(String historyId);
  Future<List<Story>> getHistoriesByTitle(String title);
  Future<List<Story>> getHistories();
}
