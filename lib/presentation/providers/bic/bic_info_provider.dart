import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/entities.dart';
import '../repositories/bic_repository_provider.dart';

typedef GetBICCallback = Future<BIC> Function(String bic);

class BICNotifier extends StateNotifier<BIC?> {
  final GetBICCallback getBICCallback;

  BICNotifier({required this.getBICCallback}) : super(null);

  Future<void> loadBIC(String bicId) async {
    state = await getBICCallback(bicId);
  }
}

final bicInfoProvider = StateNotifierProvider<BICNotifier, BIC?>((ref) {
  final getBICCallback = ref.watch(bicRepositoryProvider).getBICById;
  return BICNotifier(getBICCallback: getBICCallback);
});
