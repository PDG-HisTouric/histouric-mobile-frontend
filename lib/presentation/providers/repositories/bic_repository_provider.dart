import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/repositories.dart';
import '../../../infrastructure/datasources/datasources.dart';
import '../../../infrastructure/repositories/repositories.dart';

final bicRepositoryProvider = Provider<BICRepository>((ref) {
  return BICRepositoryImpl(datasource: SpringBootBICDatasource());
});
