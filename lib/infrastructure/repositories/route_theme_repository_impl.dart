import 'package:histouric_mobile_frontend/domain/entities/route_theme.dart';

import '../../domain/datasources/datasources.dart';
import '../../domain/repositories/repositories.dart';

class RouteThemeRepositoryImpl implements RouteThemeRepository {
  final RouteThemeDataSource routeThemeDataSource;

  RouteThemeRepositoryImpl({required this.routeThemeDataSource});

  @override
  Future<RouteTheme> getRouteThemeById(String id) {
    return routeThemeDataSource.getRouteThemeById(id);
  }

  @override
  Future<List<RouteTheme>> getRouteThemes() {
    return routeThemeDataSource.getRouteThemes();
  }
}
