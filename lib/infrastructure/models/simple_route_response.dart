class SimpleRouteResponse {
  final String id;
  final String name;
  final String description;

  SimpleRouteResponse({
    required this.id,
    required this.name,
    required this.description,
  });

  factory SimpleRouteResponse.fromJson(Map<String, dynamic> json) =>
      SimpleRouteResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );
}
