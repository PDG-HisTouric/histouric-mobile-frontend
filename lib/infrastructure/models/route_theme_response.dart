class RouteThemeResponse {
  final String id;
  final String name;
  final List<RouteForRouteThemeResponse> routes;

  RouteThemeResponse({
    required this.id,
    required this.name,
    required this.routes,
  });

  factory RouteThemeResponse.fromJson(Map<String, dynamic> json) {
    return RouteThemeResponse(
      id: json['id'],
      name: json['name'],
      routes: (json['routes'] as List)
          .map((e) => RouteForRouteThemeResponse.fromJson(e))
          .toList(),
    );
  }
}

class RouteForRouteThemeResponse {
  final String id;
  final String name;
  final String description;

  RouteForRouteThemeResponse({
    required this.id,
    required this.name,
    required this.description,
  });

  factory RouteForRouteThemeResponse.fromJson(Map<String, dynamic> json) {
    return RouteForRouteThemeResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
