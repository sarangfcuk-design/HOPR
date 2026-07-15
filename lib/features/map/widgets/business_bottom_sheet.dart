import 'package:flutter/material.dart';

import '../../../models/business_model.dart';

class BusinessBottomSheet extends StatelessWidget {
  final BusinessModel business;
  final VoidCallback onDetails;
  final VoidCallback onCall;
  final VoidCallback onDirections;

  const BusinessBottomSheet({
    super.key,
    required this.business,
    required this.onDetails,
    required this.onCall,
    required this.onDirections,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              business.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              business.address,
            ),

            const SizedBox(height: 18),
                        Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onCall,
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onDirections,
                    icon: const Icon(Icons.navigation),
                    label: const Text("Directions"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onDetails,
                icon: const Icon(Icons.store),
                label: const Text(
                  "View Full Details",
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}