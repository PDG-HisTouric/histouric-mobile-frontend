import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionState>((ref) {
  return PermissionsNotifier();
});

class PermissionsNotifier extends StateNotifier<PermissionState> {
  PermissionsNotifier() : super(PermissionState()) {
    checkAllPermissions();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    state = state.copyWith(locationWhenInUse: status);
  }

  Future<void> checkAllPermissions() async {
    final status = await Future.wait([
      Permission.location.status,
      Permission.locationWhenInUse.status,
      Permission.locationAlways.status,
    ]);
    state = state.copyWith(
      location: status[0],
      locationWhenInUse: status[1],
      locationAlways: status[2],
    );
  }
}

class PermissionState {
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;
  final PermissionStatus location;

  PermissionState({
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
  });

  PermissionState copyWith({
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
    PermissionStatus? location,
  }) {
    return PermissionState(
      locationAlways: locationAlways ?? this.locationAlways,
      locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      location: location ?? this.location,
    );
  }

  get locationPermissionGranted =>
      locationAlways.isGranted ||
      locationWhenInUse.isGranted ||
      location.isGranted;
}
