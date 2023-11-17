import 'package:dio/dio.dart';

import '../../config/constants/constants.dart';
import '../../domain/datasources/datasources.dart';
import '../../domain/entities/entities.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

class RouteDatasourceImpl implements RouteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${Environment.baseUrl}/api/v1/routes',
      contentType: 'application/json',
    ),
  );

  @override
  Future<HistouricRoute> getRouteById(String routeId) {
    return dio.get('/$routeId').then((response) =>
        RouteMapper.fromRouteResponseToRoute(
            RouteResponse.fromJson(response.data)));
  }

  @override
  Future<List<SimpleRoute>> getSimplifiedRoutes() {
    return dio.get('/search').then((response) => (response.data as List)
        .map((route) => SimpleRouteMapper.fromSimpleRouteResponseToRoute(
            SimpleRouteResponse.fromJson(route)))
        .toList());
  }
}
