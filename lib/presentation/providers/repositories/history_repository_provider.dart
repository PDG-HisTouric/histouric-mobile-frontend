import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';
import 'package:histouric_mobile_frontend/infrastructure/datasources/history_datasource_impl.dart';
import 'package:histouric_mobile_frontend/infrastructure/repositories/history_repository_impl.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepositoryImpl(HistoryDataSourceImpl());
});
