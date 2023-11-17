import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/config.dart';
import '../../../domain/domain.dart';
import '../providers.dart';

class MapState {
  final bool isControllerReady;
  final List<Marker> markers;
  final GoogleMapController? controller;
  final Map<PolylineId, Polyline> polylines;

  MapState({
    this.markers = const [],
    this.isControllerReady = false,
    this.controller,
    this.polylines = const {},
  });

  Set<Marker> get markersSet {
    return Set.from(markers);
  }

  MapState copyWith({
    List<Marker>? markers,
    bool? isControllerReady,
    GoogleMapController? controller,
    Map<PolylineId, Polyline>? polylines,
  }) {
    return MapState(
      markers: markers ?? this.markers,
      isControllerReady: isControllerReady ?? this.isControllerReady,
      controller: controller ?? this.controller,
      polylines: polylines ?? this.polylines,
    );
  }
}

class MapNotifier extends StateNotifier<MapState> {
  final BICRepository bicRepository;
  final BuildContext context;
  final Future<void> Function(String id) loadBIC;

  MapNotifier({
    required this.bicRepository,
    required this.context,
    required this.loadBIC,
  }) : super(MapState());

  void setMarkers(List<BIC> bics) async {
    for (var bic in bics) {
      _addMarker(
        latitude: bic.latitude,
        longitude: bic.longitude,
        name: bic.name,
        snippet: bic.description,
        bicId: bic.bicId,
      );
    }
    while (state.markers.length != bics.length) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  void loadBICsFromBICRepository() async {
    final bics = await bicRepository.getBICs();
    for (var bic in bics) {
      _addMarker(
        latitude: bic.latitude,
        longitude: bic.longitude,
        name: bic.name,
        snippet: bic.description,
        bicId: bic.bicId,
      );
    }
    while (state.markers.length != bics.length) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  void setPolylines(Map<PolylineId, Polyline> polylines) {
    state = state.copyWith(polylines: polylines);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isControllerReady: true);
  }

  void goToLocation(double latitude, double longitude) {
    final newPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );

    state.controller
        ?.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  void _addMarker({
    required double latitude,
    required double longitude,
    required String name,
    required String bicId,
    String? snippet,
  }) {
    final newMarker = Marker(
      markerId: MarkerId('${state.markers.length}'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: name,
        snippet: snippet,
        onTap: () {
          loadBIC(bicId);
          context.push('/$bicScreenPath/$bicId');
        },
      ),
    );

    state = state.copyWith(markers: [...state.markers, newMarker]);
  }
}

final mapProvider = StateNotifierProvider.autoDispose
    .family<MapNotifier, MapState, BuildContext>((ref, context) {
  final bicRepository = ref.watch(bicRepositoryProvider);
  final loadBIC = ref.watch(bicInfoProvider.notifier).loadBIC;
  return MapNotifier(
    bicRepository: bicRepository,
    context: context,
    loadBIC: loadBIC,
  );
});
