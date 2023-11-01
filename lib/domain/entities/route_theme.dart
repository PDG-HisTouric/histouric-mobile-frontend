class RouteTheme {
  final String id;
  final String name;
  final List<RouteForRouteTheme> routes;

  RouteTheme({
    required this.id,
    required this.name,
    required this.routes,
  });
}

class RouteForRouteTheme {
  final String id;
  final String name;
  final String description;

  RouteForRouteTheme({
    required this.id,
    required this.name,
    required this.description,
  });
}
