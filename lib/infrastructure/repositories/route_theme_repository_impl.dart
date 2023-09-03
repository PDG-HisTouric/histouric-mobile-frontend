import 'package:histouric_mobile_frontend/domain/entities/routes_theme.dart';

import '../../domain/datasources/datasources.dart';
import '../../domain/repositories/repositories.dart';

class RouteThemeRepositoryImpl implements RouteThemeRepository {
  final RouteThemeDataSource routeThemeDataSource;

  RouteThemeRepositoryImpl({required this.routeThemeDataSource});

  @override
  Future<RoutesTheme> getRouteThemeById(String id) {
    return routeThemeDataSource.getRouteThemeById(id);
  }

  @override
  Future<List<RoutesTheme>> getRouteThemes() {
    return routeThemeDataSource.getRouteThemes();
  }
}
