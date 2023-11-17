import 'bic_response.dart';
import 'histouric_user_response.dart';

class RouteResponse {
  final String id;
  final String name;
  final String description;
  final HistouricUserResponse owner;
  final List<BICResponse> bics;

  RouteResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.owner,
    required this.bics,
  });

  factory RouteResponse.fromJson(Map<String, dynamic> json) => RouteResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        owner: HistouricUserResponse.fromJson(json["owner"]),
        bics: (json["bics"] as List)
            .map((bic) => BICResponse.fromJson(bic))
            .toList(),
      );
}
