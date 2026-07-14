import 'package:geolocator/geolocator.dart';

import '../../../repositories/business_repository.dart';
import '../models/location_model.dart';
import '../models/map_data_model.dart';

class MapRepository {
  final BusinessRepository _businessRepository = BusinessRepository();

  Future<MapDataModel> getMapData() async {
    // Check Location Service
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location service is disabled.");
    }

    // Check Permission
    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission =
          await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception("Location permission denied.");
    }

    if (permission ==
        LocationPermission.deniedForever) {
      throw Exception(
        "Location permission permanently denied.",
      );
    }

    // Current GPS Location
    final Position position =
        await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    // Fetch Businesses
    final businesses =
        await _businessRepository.getAllBusinesses();

    return MapDataModel(
      currentLocation: LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
      businesses: businesses,
    );
  }
}