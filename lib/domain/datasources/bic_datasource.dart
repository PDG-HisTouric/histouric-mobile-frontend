import '../entities/entities.dart';

abstract class BICDatasource {
  Future<List<BIC>> getBICs();
  Future<BIC> getBICById(String bicId);
}
