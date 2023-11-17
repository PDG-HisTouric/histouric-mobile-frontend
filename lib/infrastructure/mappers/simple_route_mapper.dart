import '../../domain/entities/entities.dart';
import '../models/models.dart';

class SimpleRouteMapper {
  static SimpleRoute fromSimpleRouteResponseToRoute(
      SimpleRouteResponse simpleRouteResponse) {
    return SimpleRoute(
      id: simpleRouteResponse.id,
      name: simpleRouteResponse.name,
      description: simpleRouteResponse.description,
    );
  }
}
