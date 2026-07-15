import 'package:flutter/material.dart';

class MapFab extends StatelessWidget {
  final VoidCallback onPressed;

  const MapFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 20,
      child: FloatingActionButton(
        heroTag: "map_fab",
        backgroundColor: Colors.blue,
        elevation: 8,
        onPressed: onPressed,
        child: const Icon(
          Icons.my_location,
          color: Colors.white,
        ),
      ),
    );
  }
}