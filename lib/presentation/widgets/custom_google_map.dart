import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/entities.dart';
import '../providers/providers.dart';

class CustomGoogleMap extends ConsumerStatefulWidget {
  final double initialLat;
  final double initialLng;
  final List<BIC>? bics;

  const CustomGoogleMap({
    super.key,
    required this.initialLat,
    required this.initialLng,
    this.bics,
  });

  @override
  ConsumerState<CustomGoogleMap> createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<CustomGoogleMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider(context));

    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initialLng),
        zoom: 15,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      onMapCreated: (controller) {
        ref
            .read(mapControllerProvider(context).notifier)
            .setMapController(controller);
        if (widget.bics != null && widget.bics!.isNotEmpty) {
          ref
              .read(mapControllerProvider(context).notifier)
              .setMarkers(widget.bics!);
        } else {
          ref
              .read(mapControllerProvider(context).notifier)
              .loadBICsFromBICRepository();
        }
      },
    );
  }
}
