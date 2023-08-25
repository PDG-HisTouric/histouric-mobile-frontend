import '../entities/entities.dart';

abstract class BICDatasource {
  Future<List<BIC>> getBICs();
}
