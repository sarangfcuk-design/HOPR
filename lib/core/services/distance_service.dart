import 'package:geolocator/geolocator.dart';

class DistanceService {
  const DistanceService();

  double calculateDistance({
    required double userLatitude,
    required double userLongitude,
    required double businessLatitude,
    required double businessLongitude,
  }) {
    final meters = Geolocator.distanceBetween(
      userLatitude,
      userLongitude,
      businessLatitude,
      businessLongitude,
    );

    return meters;
  }

  String formatDistance(double meters) {
    if (meters < 1000) {
      return "${meters.round()} m";
    }

    return "${(meters / 1000).toStringAsFixed(1)} km";
  }
}