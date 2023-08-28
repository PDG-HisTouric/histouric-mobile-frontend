import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class RouteScreen extends ConsumerStatefulWidget {
  final String routeId;

  const RouteScreen({super.key, required this.routeId});

  @override
  ConsumerState<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends ConsumerState<RouteScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(routeInfoProvider.notifier).loadRoute(widget.routeId);
  }

  @override
  Widget build(BuildContext context) {
    final HistouricRoute? route = ref.watch(routeInfoProvider);

    if (route == null) {
      return const Center(child: CircularProgressIndicator());
    }

    print("bics: ${route.bics.length}");

    return Scaffold(
      appBar: AppBar(
        title: Text(route.name),
      ),
      body: CustomGoogleMap(
        initialLat: 3.451929471542798,
        initialLng: -76.5319398863662,
        bics: route.bics,
      ),
    );
  }
}
