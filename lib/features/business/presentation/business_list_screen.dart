import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/business_model.dart';
import '../providers/business_provider.dart';
import '../widgets/business_card.dart';
import 'business_detail_screen.dart';

class BusinessListScreen extends ConsumerWidget {
  final String categoryId;
  final String title;

  const BusinessListScreen({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businesses = ref.watch(businessProvider(categoryId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        elevation: 0,
        title: Text(title),
      ),
      body: businesses.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "No Businesses Found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final BusinessModel business = items[index];

              return BusinessCard(
                business: business,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BusinessDetailScreen(
                        business: business,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}