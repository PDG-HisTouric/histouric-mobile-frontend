import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/providers.dart';

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
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    print(mapController.markers.length);

    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.initialLat,
          widget.initialLng,
        ),
        zoom: 12,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
    );
  }
}
