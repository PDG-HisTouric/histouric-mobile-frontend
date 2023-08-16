import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  final double initialLat;
  final double initialLng;

  const CustomGoogleMap({
    super.key,
    required this.initialLat,
    required this.initialLng,
  });

  @override
  State<CustomGoogleMap> createState() => __MapViewState();
}

class __MapViewState extends State<CustomGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng), zoom: 12),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
      },
    );
  }
}
