import '../entities/entities.dart';

abstract class HistoryRepository {
  Future<Story> getHistoryById(String historyId);
}
