import '../entities/entities.dart';

abstract class RouteThemeDataSource {
  Future<List<RoutesTheme>> getRouteThemes();
  Future<RoutesTheme> getRouteThemeById(String id);
}
