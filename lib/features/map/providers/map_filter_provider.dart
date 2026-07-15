import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/business_model.dart';
import 'category_provider.dart';
import 'map_provider.dart';

final filteredBusinessesProvider =
    Provider<List<BusinessModel>>((ref) {
  final mapData = ref.watch(mapProvider);

  final selectedCategory =
      ref.watch(selectedCategoryProvider);

  return mapData.when(
    loading: () => [],

    error: (_, __) => [],

    data: (data) {
      if (selectedCategory == "All") {
        return data.businesses;
      }

      return data.businesses.where((business) {
        return business.categoryId
            .toLowerCase()
            .contains(
              selectedCategory.toLowerCase(),
            );
      }).toList();
    },
  );
});