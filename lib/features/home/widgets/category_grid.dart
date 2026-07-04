import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/category_provider_old.dart';

class CategoryGrid extends ConsumerWidget {
  const CategoryGrid({super.key});

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'restaurant':
        return Icons.restaurant;

      case 'local_cafe':
        return Icons.local_cafe;

      case 'shopping_bag':
        return Icons.shopping_bag;

      case 'event':
        return Icons.event;

      case 'sports_cricket':
        return Icons.sports_cricket;

      case 'local_hospital':
        return Icons.local_hospital;

      case 'hotel':
        return Icons.hotel;

      case 'fitness_center':
        return Icons.fitness_center;

      case 'spa':
        return Icons.spa;

      case 'school':
        return Icons.school;

      case 'pets':
        return Icons.pets;

      case 'build':
        return Icons.build;

      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return categories.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: CircularProgressIndicator(),
        ),
      ),

      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ),

      data: (items) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      _getIcon(item.icon),
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}