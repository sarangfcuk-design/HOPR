import 'package:latlong2/latlong.dart';

class LocationModel {
  final double latitude;
  final double longitude;

  const LocationModel({
    required this.latitude,
    required this.longitude,
  });

  LatLng toLatLng() {
    return LatLng(
      latitude,
      longitude,
    );
  }
}