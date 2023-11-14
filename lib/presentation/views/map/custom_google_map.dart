import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/providers.dart';

class CustomGoogleMap extends ConsumerStatefulWidget {
  final double initialLat;
  final double initialLng;

  const CustomGoogleMap({
    super.key,
    required this.initialLat,
    required this.initialLng,
  });

  @override
  ConsumerState<CustomGoogleMap> createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<CustomGoogleMap> {
  @override
  void initState() {
    super.initState();
    ref.read(permissionsProvider.notifier).requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapProvider(context));
    final permissions = ref.watch(permissionsProvider);

    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initialLng),
        zoom: 15,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (controller) {
        controller.getVisibleRegion().then((value) async {
          ref.read(mapProvider(context).notifier).setMapController(controller);

          ref.read(mapProvider(context).notifier).loadBICsFromBICRepository();
        });
      },
    );
  }
}
