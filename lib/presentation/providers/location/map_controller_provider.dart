import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:histouric_mobile_frontend/domain/domain.dart';

import '../repositories/bic_provider.dart';

class MapState {
  final bool areMarkersReady;
  final bool isControllerReady;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState({
    this.areMarkersReady = false,
    this.markers = const [],
    this.isControllerReady = false,
    this.controller,
  });

  Set<Marker> get markersSet {
    return Set.from(markers);
  }

  MapState copyWith({
    bool? areMarkersReady,
    List<Marker>? markers,
    bool? isControllerReady,
    GoogleMapController? controller,
  }) {
    return MapState(
      areMarkersReady: areMarkersReady ?? this.areMarkersReady,
      markers: markers ?? this.markers,
      isControllerReady: isControllerReady ?? this.isControllerReady,
      controller: controller ?? this.controller,
    );
  }
}

class MapNotifier extends StateNotifier<MapState> {
  final BICRepository bicRepository;

  MapNotifier({required this.bicRepository}) : super(MapState()) {
    _loadBICs();
  }

  void _loadBICs() async {
    final bics = await bicRepository.getBICs();
    for (var bic in bics) {
      addMarker(
        latitude: bic.latitude,
        longitude: bic.longitude,
        name: bic.name,
        snippet: bic.description,
      );
    }
    while (state.markers.length != bics.length) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
    state = state.copyWith(areMarkersReady: true);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isControllerReady: true);
  }

  goToLocation(double latitude, double longitude) {
    final newPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );

    state.controller
        ?.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  void addMarker({
    required double latitude,
    required double longitude,
    required String name,
    String? snippet,
  }) {
    final newMarker = Marker(
      markerId: MarkerId('${state.markers.length}'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: name,
        snippet: snippet,
      ),
    );

    state = state.copyWith(markers: [...state.markers, newMarker]);
  }
}

final mapControllerProvider =
    StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  final bicRepository = ref.watch(bicRepositoryProvider);
  return MapNotifier(bicRepository: bicRepository);
});
