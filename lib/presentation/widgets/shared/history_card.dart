import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/config.dart';
import '../../../domain/entities/entities.dart';
import '../widgets.dart';

class HistoryCard extends StatelessWidget {
  final Story story;

  const HistoryCard({
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        context.push('/$historyScreenPath/${story.id}');
      },
      child: FadeIn(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GeneralCard(
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  height: 96,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Image.network(
                      story.images?.first.imageUri ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return FadeIn(child: child);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.title,
                        style: textStyles.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}