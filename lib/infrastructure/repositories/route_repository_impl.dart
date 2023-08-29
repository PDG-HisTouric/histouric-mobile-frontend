import 'package:histouric_mobile_frontend/domain/entities/histouric_route.dart';

import '../../domain/datasources/datasources.dart';
import '../../domain/repositories/repositories.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource routeDataSource;

  RouteRepositoryImpl({required this.routeDataSource});

  @override
  Future<HistouricRoute> getRouteById(String routeId) {
    return routeDataSource.getRouteById(routeId);
  }
}
