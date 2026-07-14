import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/map_data_model.dart';
import '../repositories/map_repository.dart';

final mapRepositoryProvider = Provider<MapRepository>((ref) {
  return MapRepository();
});

final mapProvider = FutureProvider<MapDataModel>((ref) async {
  return await ref
      .read(mapRepositoryProvider)
      .getMapData();
});