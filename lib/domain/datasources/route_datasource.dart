import '../entities/entities.dart';

abstract class RouteDataSource {
  Future<HistouricRoute> getRouteById(String routeId);
  Future<List<SimpleRoute>> getSimplifiedRoutes();
}
