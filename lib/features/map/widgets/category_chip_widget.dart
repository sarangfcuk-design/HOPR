import 'package:flutter/material.dart';

class CategoryChipWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChipWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),

        margin: const EdgeInsets.only(
          right: 10,
        ),

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : Colors.white,

          borderRadius:
              BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : Colors.black87,
            ),

            const SizedBox(width: 8),

            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black87,

                fontWeight:
                    FontWeight.w600,
              ),
            ),
                      ],
        ),
      ),
    );
  }
}