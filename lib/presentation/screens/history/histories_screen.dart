import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';
import 'package:histouric_mobile_frontend/presentation/presentation.dart';

class HistoriesScreen extends ConsumerStatefulWidget {
  const HistoriesScreen({super.key});

  @override
  ConsumerState<HistoriesScreen> createState() => _HistoriesScreenState();
}

class _HistoriesScreenState extends ConsumerState<HistoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final (histories, areHistoriesLoading) = ref.watch(historiesInfoProvider);
    print("areHistoriesLoading: $areHistoriesLoading");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "Buscar historia por nombre",
            prefixIcon: const Icon(Icons.search),
            onChanged: (value) {
              ref
                  .read(historiesInfoProvider.notifier)
                  .getHistoriesByTitle(value);
            },
          ),
          Expanded(
            child: areHistoriesLoading
                ? const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
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
