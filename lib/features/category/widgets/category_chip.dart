import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon() {
    switch (icon) {
      case 'restaurant':
        return Icons.restaurant;
      case 'local_cafe':
        return Icons.local_cafe;
      case 'hotel':
        return Icons.hotel;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'local_hospital':
        return Icons.local_hospital;
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
      case 'sports_cricket':
        return Icons.sports_cricket;
      case 'event':
        return Icons.event;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        avatar: Icon(
          _getIcon(),
          size: 18,
          color: isSelected
              ? Colors.white
              : Colors.black54,
        ),
        label: Text(title),
        selected: isSelected,
        onSelected: (_) => onTap(),
        selectedColor: Colors.blue,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected
              ? Colors.white
              : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}