import '../entities/entities.dart';

abstract class RouteThemeRepository {
  Future<List<RouteTheme>> getRouteThemes();
  Future<RouteTheme> getRouteThemeById(String id);
}
