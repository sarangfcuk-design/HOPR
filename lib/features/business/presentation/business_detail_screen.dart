import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/rating_badge.dart';
import '../../../models/business_model.dart';

class BusinessDetailScreen extends StatelessWidget {
  final BusinessModel business;

  const BusinessDetailScreen({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(business.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 230,
              width: double.infinity,
              color: Colors.grey.shade900,
              child: const Icon(
                Icons.store,
                color: Colors.white,
                size: 90,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          business.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      RatingBadge(
                        rating: business.rating,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  if (business.isVerified)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Verified",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  Row(
                    children: [

                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          business.address,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    business.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(business.phone),
                    ),
                  ),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(business.website),
                    ),
                  ),

                  Card(
                    color: AppColors.surface,
                    child: ListTile(
                      leading: const Icon(Icons.access_time),
                      title: Text(
                        "${business.openingTime} - ${business.closingTime}",
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}