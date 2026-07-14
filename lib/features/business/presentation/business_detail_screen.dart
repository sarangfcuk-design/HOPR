import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/url_launcher_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/rating_badge.dart';
import '../../../models/business_model.dart';
import '../../favorites/providers/favorite_provider.dart';

class BusinessDetailScreen extends ConsumerWidget {
  final BusinessModel business;

  const BusinessDetailScreen({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launcher = UrlLauncherService();

    final favoriteState = ref.watch(favoriteProvider);

    final isFavorite = favoriteState.when(
      data: (items) =>
          items.any((e) => e.businessId == business.id),
      loading: () => false,
      error: (_, _) => false,
    );

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(business.name),

        actions: [
          IconButton(
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () async {
              final notifier =
                  ref.read(favoriteProvider.notifier);

              if (isFavorite) {
                await notifier.removeFavorite(
                  business.id,
                );
              } else {
                await notifier.addFavorite(
                  business.id,
                );
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 240,
                child: business.coverImage.isNotEmpty
                    ? Image.network(
                        business.coverImage,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) {
                          return Container(
                            color:
                                Colors.grey.shade900,
                            child:
                                const Center(
                              child: Icon(
                                Icons.store,
                                color:
                                    Colors.white,
                                size: 90,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        color:
                            Colors.grey.shade900,
                        child:
                            const Center(
                          child: Icon(
                            Icons.store,
                            color:
                                Colors.white,
                            size: 90,
                          ),
                        ),
                      ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          business.name,
                          style:
                              const TextStyle(
                            color:
                                Colors.white,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      RatingBadge(
                        rating:
                            business.rating,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  if (business.isVerified)
                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration:
                          BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(
                                20),
                      ),
                      child: const Text(
                        "Verified",
                        style: TextStyle(
                          color:
                              Colors.white,
                        ),
                      ),
                    ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    business.address,
                    style:
                        const TextStyle(
                      color:
                          Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    business.description,
                    style:
                        const TextStyle(
                      color:
                          Colors.white70,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                                    Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(business.phone),
                      trailing: const Icon(Icons.call),
                      onTap: () async {
                        await launcher.call(
                          business.phone,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(
                        business.website,
                      ),
                      trailing: const Icon(
                        Icons.open_in_new,
                      ),
                      onTap: () async {
                        await launcher.website(
                          business.website,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(
                        Icons.access_time,
                      ),
                      title: Text(
                        "${business.openingTime} - ${business.closingTime}",
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(
                        Icons.directions,
                      ),
                      title: const Text(
                        "Directions",
                      ),
                      trailing: const Icon(
                        Icons.navigation,
                      ),
                      onTap: () async {
                        await launcher.directions(
                          business.latitude,
                          business.longitude,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}