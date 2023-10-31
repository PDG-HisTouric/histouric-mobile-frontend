import '../../domain/entities/entities.dart';
import '../models/models.dart';

class RouteThemeMapper {
  static RouteTheme fromRouteThemeResponse(
    RouteThemeResponse routeThemeResponse,
  ) {
    List<RouteForRouteTheme> routes = [];
    for (var route in routeThemeResponse.routes) {
      routes.add(fromRouteForRouteThemeResponse(route));
    }

    return RouteTheme(
      id: routeThemeResponse.id,
      name: routeThemeResponse.name,
      routes: routes,
    );
  }

  static fromRouteForRouteThemeResponse(
    RouteForRouteThemeResponse routeForRouteThemeResponse,
  ) {
    return RouteForRouteTheme(
      id: routeForRouteThemeResponse.id,
      name: routeForRouteThemeResponse.name,
      description: routeForRouteThemeResponse.description,
    );
  }
}
