import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/business_model.dart';
import '../../../repositories/business_repository.dart';
import '../../business/presentation/business_detail_screen.dart';
import '../providers/favorite_provider.dart';
import '../widgets/favorite_card.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Saved"),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: favoriteState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),

        data: (favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                "No Favorites Yet ❤️",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            );
          }

          return FutureBuilder<List<BusinessModel>>(
            future: BusinessRepository().getAllBusinesses(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final businesses = snapshot.data!;

              final savedBusinesses = businesses.where((business) {
                return favorites.any(
                  (fav) => fav.businessId == business.id,
                );
              }).toList();

              return ListView.builder(
                itemCount: savedBusinesses.length,
                itemBuilder: (context, index) {
                  final business = savedBusinesses[index];

                  return FavoriteCard(
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
          );
        },
      ),
    );
  }
}