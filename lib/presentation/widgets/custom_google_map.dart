import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:histouric_mobile_frontend/config/config.dart';

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
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider(context));

    return GoogleMap(
      polylines: Set<Polyline>.of(polylines.values),
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initialLng),
        zoom: 15,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      onMapCreated: (controller) {
        controller.getVisibleRegion().then((value) async {
          ref
              .read(mapControllerProvider(context).notifier)
              .setMapController(controller);
          if (widget.bics != null && widget.bics!.isNotEmpty) {
            ref
                .read(mapControllerProvider(context).notifier)
                .setMarkers(widget.bics!);
            await _getPolyline();
          } else {
            ref
                .read(mapControllerProvider(context).notifier)
                .loadBICsFromBICRepository();
          }
        });
      },
    );
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Environment.directionsApiKey,
        PointLatLng(widget.bics![0].latitude, widget.bics![0].longitude),
        PointLatLng(widget.bics![1].latitude, widget.bics![1].longitude),
        travelMode: TravelMode.driving,
        // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
      );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      _addPolyLine();
    } catch (e) {
      print(e);
    }
  }
}
