import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../../domain/entities/entities.dart';
import '../providers/providers.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE7C18B),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            _CustomSliverAppbar(
              bic: bic,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => _BICDetails(bic: bic),
            ))
          ],
        ),
      ),
    );
  }
}

class _BICDetails extends StatelessWidget {
  final BIC bic;
  const _BICDetails({required this.bic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleAndDescription(bic: bic),
          _Histories(bic: bic),
        ],
      ),
    );
  }
}

class _CustomSliverAppbar extends ConsumerWidget {
  final BIC bic;

  const _CustomSliverAppbar({required this.bic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    const scaffoldBackgroundColor = Color(0xFFE7C18B);

    return SliverAppBar(
      backgroundColor: scaffoldBackgroundColor,
      expandedHeight: size.height * 0.7,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_rounded),
        style: IconButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape:
              CircleBorder(side: BorderSide(color: colors.onPrimary, width: 2)),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 0),
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PageView.builder(
                itemCount: bic.images.length,
                itemBuilder: (context, index) =>
                    _ImageCard(image: bic.images[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String image;

  const _ImageCard({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: size.height * 0.5,
            width: size.width * 0.8,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return FadeIn(child: child);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleAndDescription extends StatelessWidget {
  final BIC bic;

  const _TitleAndDescription({required this.bic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              bic.name,
              style: TextStyle(
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _GeneralCard(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bic.description,
                  style: textStyles.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final BICHistory historyBIC;

  const _HistoryCard({
    required this.historyBIC,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        context.push('/$historyScreenPath/${historyBIC.historyId}');
      },
      child: FadeIn(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: _GeneralCard(
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Image.network(
                      historyBIC.image,
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
                        historyBIC.title,
                        style: textStyles.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        historyBIC.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
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

class _Histories extends StatelessWidget {
  final BIC bic;
  const _Histories({required this.bic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Historias',
              style: TextStyle(
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bic.histories.length,
          itemBuilder: (context, index) => _HistoryCard(
            historyBIC: bic.histories[index],
          ),
        ),
      ],
    );
  }
}

class _GeneralCard extends StatelessWidget {
  final Widget child;

  const _GeneralCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Altura de la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Radio de borde redondeado
      ),
      child: child,
    );
  }
}
