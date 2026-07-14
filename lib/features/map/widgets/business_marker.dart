import 'package:flutter/material.dart';

import '../../../models/business_model.dart';

class BusinessMarker extends StatelessWidget {
  final BusinessModel business;
  final VoidCallback? onTap;

  const BusinessMarker({
    super.key,
    required this.business,
    this.onTap,
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
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: business.isFeatured
                  ? Colors.amber
                  : Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              business.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40,
          ),
        ],
      ),
    );
  }
}