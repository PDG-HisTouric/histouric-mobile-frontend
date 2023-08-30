import '../entities/entities.dart';

abstract class RouteThemeRepository {
  Future<List<RoutesTheme>> getRouteThemes();
  Future<RoutesTheme> getRouteThemeById(String id);
}
