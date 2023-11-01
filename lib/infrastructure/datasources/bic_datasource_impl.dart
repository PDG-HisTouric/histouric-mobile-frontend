import 'package:dio/dio.dart';

import '../../config/constants/constants.dart';
import '../../domain/domain.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

class BICDatasourceImpl implements BICDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${Environment.baseUrl}/api/v1/bics',
      contentType: 'application/json',
    ),
  );

  @override
  Future<List<BIC>> getBICs() {
    return dio.get('').then((response) {
      List<BICResponse> bicResponses =
          (response.data as List).map((e) => BICResponse.fromJson(e)).toList();

      return bicResponses.map((e) => BICMapper.fromBICResponse(e)).toList();
    });
  }

  @override
  Future<BIC> getBICById(String bicId) {
    return dio.get('/$bicId').then((response) {
      return BICMapper.fromBICResponse(BICResponse.fromJson(response.data));
    });
  }
}
