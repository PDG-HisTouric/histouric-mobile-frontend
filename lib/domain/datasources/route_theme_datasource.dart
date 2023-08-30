import '../entities/entities.dart';

abstract class RouteThemeDataSource {
  Future<List<RouteTheme>> getRouteThemes();
  Future<RouteTheme> getRouteThemeById(String id);
}
