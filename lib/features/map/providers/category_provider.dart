import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider =
    StateProvider<String>(
  (ref) => "All",
);

final categoriesProvider =
    Provider<List<Map<String, dynamic>>>(
  (ref) {
    return [
      {
        "title": "All",
      },

      {
        "title": "Food",
      },

      {
        "title": "Cafe",
      },

      {
        "title": "Hotel",
      },

      {
        "title": "Shopping",
      },

      {
        "title": "Hospital",
      },

      {
        "title": "Gym",
      },

      {
        "title": "Salon",
      },
            {
        "title": "Medical",
      },

      {
        "title": "Pet",
      },

      {
        "title": "Education",
      },

      {
        "title": "Electronics",
      },

      {
        "title": "Automobile",
      },
    ];
  },
);