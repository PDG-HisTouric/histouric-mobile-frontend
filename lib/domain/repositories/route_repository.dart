import '../entities/entities.dart';

abstract class RouteRepository {
  Future<HistouricRoute> getRouteById(String routeId);
}
