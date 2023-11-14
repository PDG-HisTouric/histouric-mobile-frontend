import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'bic_mapper.dart';
import 'histouric_user_mapper.dart';

class RouteMapper {
  static HistouricRoute fromRouteResponseToRoute(RouteResponse routeResponse) {
    return HistouricRoute(
      id: routeResponse.id,
      name: routeResponse.name,
      description: routeResponse.description,
      owner: HistouricUserMapper.fromHistouricUserResponse(routeResponse.owner),
      bics: routeResponse.bics
          .map((bic) => BICMapper.fromBICResponse(bic))
          .toList(),
    );
  }
}
