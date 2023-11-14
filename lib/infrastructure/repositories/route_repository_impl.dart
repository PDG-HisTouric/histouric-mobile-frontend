import '../../domain/datasources/datasources.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource routeDataSource;

  RouteRepositoryImpl({required this.routeDataSource});

  @override
  Future<HistouricRoute> getRouteById(String routeId) {
    return routeDataSource.getRouteById(routeId);
  }

  @override
  Future<List<SimpleRoute>> getSimplifiedRoutes() {
    return routeDataSource.getSimplifiedRoutes();
  }
}
