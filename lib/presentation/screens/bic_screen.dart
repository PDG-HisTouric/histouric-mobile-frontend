import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/presentation/providers/bic/bic_info_provider.dart';

import '../../domain/entities/entities.dart';

class BICScreen extends ConsumerStatefulWidget {
  final String bicId;

  const BICScreen({super.key, required this.bicId});

  @override
  ConsumerState<BICScreen> createState() => _BICScreenState();
}

class _BICScreenState extends ConsumerState<BICScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(bicInfoProvider.notifier).loadBIC(widget.bicId);
  }

  @override
  Widget build(BuildContext context) {
    final BIC? bic = ref.watch(bicInfoProvider);

    if (bic == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(bic!.name),
      ),
      body: Center(
        child: Text('BIC Screen: ${widget.bicId}'),
      ),
    );
  }
}
