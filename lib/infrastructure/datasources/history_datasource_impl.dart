import 'package:dio/dio.dart';

import '../../config/constants/constants.dart';
import '../../domain/domain.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';

class HistoryDataSourceImpl extends HistoryDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${Environment.baseUrl}/api/v1/histories',
      contentType: 'application/json',
    ),
  );

  @override
  Future<Story> getHistoryById(String historyId) {
    return dio.get('/$historyId').then((response) {
      return HistoryMapper.fromHistoryResponseToHistory(
        HistoryResponse.fromJson(response.data),
      );
    });
  }

  @override
  Future<List<Story>> getHistoriesByTitle(String title) {
    return dio.get('/title/$title').then((value) => value.data
        .map<Story>((history) => HistoryMapper.fromHistoryResponseToHistory(
            HistoryResponse.fromJson(history)))
        .toList());
  }
}
