import '../../../models/business_model.dart';
import 'location_model.dart';

class MapDataModel {
  final LocationModel currentLocation;
  final List<BusinessModel> businesses;

  const MapDataModel({
    required this.currentLocation,
    required this.businesses,
  });
}