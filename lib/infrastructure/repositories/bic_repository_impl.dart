import 'package:histouric_mobile_frontend/domain/domain.dart';

class BICRepositoryImpl implements BICRepository {
  final BICDatasource datasource;

  BICRepositoryImpl({required this.datasource});

  @override
  Future<List<BIC>> getBICs() {
    return datasource.getBICs();
  }

  @override
  Future<BIC> getBICById(String bicId) {
    return datasource.getBICById(bicId);
  }
}
