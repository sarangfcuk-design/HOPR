import 'package:flutter/material.dart';

import '../../../models/business_model.dart';

class BusinessMarker extends StatelessWidget {
  final BusinessModel business;
  final VoidCallback onTap;

  const BusinessMarker({
    super.key,
    required this.business,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: business.isFeatured
                  ? Colors.orange
                  : Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              business.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 4),

          Icon(
            Icons.location_on,
            color: business.isFeatured
                ? Colors.orange
                : Colors.red,
            size: 36,
          ),
        ],
      ),
    );
  }
}