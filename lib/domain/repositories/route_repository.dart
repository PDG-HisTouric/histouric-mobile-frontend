import '../entities/entities.dart';

abstract class RouteRepository {
  Future<HistouricRoute> getRouteById(String routeId);
  Future<List<SimpleRoute>> getSimplifiedRoutes();
}
