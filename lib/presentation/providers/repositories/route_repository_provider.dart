import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/infrastructure/datasources/route_datasource_impl.dart';
import 'package:histouric_mobile_frontend/infrastructure/repositories/route_repository_impl.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  return RouteRepositoryImpl(routeDataSource: RouteDatasourceImpl());
});
