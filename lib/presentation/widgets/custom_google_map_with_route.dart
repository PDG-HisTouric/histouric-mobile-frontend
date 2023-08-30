import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:histouric_mobile_frontend/config/config.dart';

import '../../config/helpers/helpers.dart';
import '../../domain/entities/entities.dart';
import '../providers/providers.dart';

class CustomGoogleMapWithRoute extends ConsumerStatefulWidget {
  final double initialLat;
  final double initialLng;
  final List<BIC> bics;

  const CustomGoogleMapWithRoute({
    super.key,
    required this.initialLat,
    required this.initialLng,
    required this.bics,
  });

  @override
  ConsumerState<CustomGoogleMapWithRoute> createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<CustomGoogleMapWithRoute> {
  @override
  void initState() {
    super.initState();
    ref.read(permissionsProvider.notifier).requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    final permissions = ref.watch(permissionsProvider);
    final userLocation = ref.watch(userLocationProvider);

    if (!permissions.locationPermissionGranted) {
      return _GoogleMap(
        initialLat: widget.initialLat,
        initialLng: widget.initialLng,
        bics: widget.bics,
      );
    } else {
      return userLocation.when(
        data: (data) => _GoogleMap(
          initialLat: widget.initialLat,
          initialLng: widget.initialLng,
          bics: widget.bics,
          userLocation: data,
        ),
        error: (error, stackTrace) => const Center(
          child: Text('Un error ocurrió al intentar obtener la ubicación.'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      );
    }
  }
}

class _GoogleMap extends ConsumerWidget {
  final double initialLat;
  final double initialLng;
  final List<BIC> bics;
  final (double, double)? userLocation;

  _GoogleMap({
    required this.initialLat,
    required this.initialLng,
    required this.bics,
    this.userLocation,
  });

  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapProvider(context));
    final permissions = ref.watch(permissionsProvider);

    return GoogleMap(
      polylines: Set<Polyline>.of(mapController.polylines.values),
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(initialLat, initialLng),
        zoom: 15,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (controller) {
        controller.getVisibleRegion().then((value) async {
          ref.read(mapProvider(context).notifier).setMapController(controller);
          ref.read(mapProvider(context).notifier).setMarkers(bics!);
          if (!permissions.locationPermissionGranted) {
            Dialogs.showGeneralDialog(
                context: context,
                title: 'Permisos',
                content: 'Por favor acepta los permisos de ubicación si '
                    'quieres ver tu ubicación en el mapa');
          }
          await _getPolyline(
            userLocation: userLocation,
            functionToSetPolylines:
                ref.read(mapProvider(context).notifier).setPolylines,
          );
        });
      },
    );
  }

  _addPolyLine(
      {required void Function(Map<PolylineId, Polyline> polylines)
          functionToSetPolylines}) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    Map<PolylineId, Polyline> polylines = {};
    polylines[id] = polyline;
    functionToSetPolylines(polylines);
  }

  _getPolyline({
    (double latitude, double longitude)? userLocation,
    required void Function(Map<PolylineId, Polyline> polylines)
        functionToSetPolylines,
  }) async {
    List<BIC> points;
    if (userLocation != null) {
      points = bics.sublist(0, bics.length - 1);
    } else {
      points = bics.sublist(1, bics.length - 1);
    }
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Environment.directionsApiKey,
        PointLatLng(
          userLocation?.$1 ?? bics[0].latitude,
          userLocation?.$2 ?? bics[0].longitude,
        ),
        PointLatLng(
            bics[bics.length - 1].latitude, bics[bics.length - 1].longitude),
        travelMode: TravelMode.walking,
        wayPoints: points
            .map((e) => PolylineWayPoint(
                location: "${e.latitude},${e.longitude}", stopOver: true))
            .toList());
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine(functionToSetPolylines: functionToSetPolylines);
  }
}
