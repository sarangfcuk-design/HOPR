import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/category_provider.dart';
import 'category_chip_widget.dart';

class CategoryChipsBar extends ConsumerWidget {
  const CategoryChipsBar({
    super.key,
  });

  static const Map<String, IconData> _icons = {
    "All": Icons.apps,
    "Food": Icons.restaurant,
    "Cafe": Icons.local_cafe,
    "Hotel": Icons.hotel,
    "Shopping": Icons.shopping_bag,
    "Hospital": Icons.local_hospital,
    "Gym": Icons.fitness_center,
    "Salon": Icons.content_cut,
    "Medical": Icons.medication,
    "Pet": Icons.pets,
    "Education": Icons.school,
    "Electronics": Icons.devices,
    "Automobile": Icons.directions_car,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected =
        ref.watch(selectedCategoryProvider);

    final categories =
        ref.watch(categoriesProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 84,
          left: 12,
        ),
        child: SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection:
                Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (_, index) {
              final category =
                  categories[index];

              final title =
                  category["title"] as String;

              return CategoryChipWidget(
                title: title,

                icon:
                    _icons[title] ??
                        Icons.category,

                isSelected:
                    selected == title,

                onTap: () {
                  ref
                      .read(
                        selectedCategoryProvider
                            .notifier,
                      )
                      .state = title;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}