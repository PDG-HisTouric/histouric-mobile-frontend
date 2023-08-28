import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final bicRepositoryProvider = Provider<BICRepository>((ref) {
  return BICRepositoryImpl(datasource: SpringBootBICDatasource());
});
