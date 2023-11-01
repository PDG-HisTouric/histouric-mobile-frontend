import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

class HistoriesScreen extends ConsumerWidget {
  const HistoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Story> histories = ref.watch(historiesInfoProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "Buscar historia por nombre",
            prefixIcon: const Icon(Icons.search),
            onChanged: (value) {
              ref.read(historiesInfoProvider.notifier).getHistories(value);
            },
          ),
          // if (!areHistoriesLoading)
          Expanded(
            child: ListView.builder(
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final history = histories[index];
                return HistoryCard(
                  story: history,
                );
              },
            ),
          ),
          // if (areHistoriesLoading)
          //   const Column(
          //     children: [
          //       Spacer(),
          //       CircularProgressIndicator(),
          //       Spacer(),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
