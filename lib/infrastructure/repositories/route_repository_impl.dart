import 'package:histouric_mobile_frontend/domain/entities/route.dart';

import '../../domain/datasources/datasources.dart';
import '../../domain/repositories/repositories.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource routeDataSource;

  RouteRepositoryImpl(this.routeDataSource);

  @override
  Future<Route> getRouteById(String routeId) {
    return routeDataSource.getRouteById(routeId);
  }
}
