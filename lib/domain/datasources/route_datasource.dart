import '../entities/entities.dart';

abstract class RouteDataSource {
  Future<Route> getRouteById(String routeId);
}
