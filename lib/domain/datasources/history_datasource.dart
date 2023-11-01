import '../entities/entities.dart';

abstract class HistoryDataSource {
  Future<Story> getHistoryById(String historyId);
  Future<List<Story>> getHistoriesByTitle(String title);
}
