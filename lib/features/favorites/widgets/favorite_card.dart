import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/business_model.dart';

class FavoriteCard extends StatelessWidget {
  final BusinessModel business;
  final VoidCallback onTap;

  const FavoriteCard({
    super.key,
    required this.business,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          child: Icon(Icons.favorite,color: Colors.red),
        ),
        title: Text(
          business.name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          business.address,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 18,
        ),
      ),
    );
  }
}