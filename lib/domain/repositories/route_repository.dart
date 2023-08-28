import '../entities/entities.dart';

abstract class RouteRepository {
  Future<Route> getRouteById(String routeId);
}
