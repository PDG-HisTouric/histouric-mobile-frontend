import '../entities/entities.dart';

abstract class HistoryRepository {
  Future<History> getHistoryById(String historyId);
}
