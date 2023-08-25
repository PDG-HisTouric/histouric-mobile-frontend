import '../entities/entities.dart';

abstract class BICRepository {
  Future<List<BIC>> getBICs();
}
