import 'package:dio/dio.dart';
import 'package:histouric_mobile_frontend/domain/entities/route_theme.dart';

import '../../config/constants/constants.dart';
import '../../domain/datasources/datasources.dart';
import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

class RouteThemeDataSourceImpl implements RouteThemeDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${Environment.baseUrl}/api/v1/route-themes',
      contentType: 'application/json',
    ),
  );

  @override
  Future<List<RouteTheme>> getRouteThemes() {
    return dio.get('').then((response) {
      List<RouteThemeResponse> routeThemesResponses = (response.data as List)
          .map((e) => RouteThemeResponse.fromJson(e))
          .toList();

      return routeThemesResponses
          .map((e) => RouteThemeMapper.fromRouteThemeResponse(e))
          .toList();
    });
  }

  @override
  Future<RouteTheme> getRouteThemeById(String id) {
    return dio.get('/$id').then((response) {
      return RouteThemeMapper.fromRouteThemeResponse(
          RouteThemeResponse.fromJson(response.data));
    });
  }
}
