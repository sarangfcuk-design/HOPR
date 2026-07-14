import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../business/presentation/business_detail_screen.dart';
import '../providers/map_provider.dart';
import '../widgets/business_marker.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapData = ref.watch(mapProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("WeLoco Map"),
        centerTitle: true,
      ),
      body: mapData.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        data: (data) {
          return FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                data.currentLocation.latitude,
                data.currentLocation.longitude,
              ),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.example.hopr",
              ),

              MarkerLayer(
                markers: [
                  /// Current Location
                  Marker(
                    point: LatLng(
                      data.currentLocation.latitude,
                      data.currentLocation.longitude,
                    ),
                    width: 45,
                    height: 45,
                    child: const Icon(
                      Icons.my_location,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),

                  /// Business Markers
                  ...data.businesses
                      .where(
                        (business) =>
                            business.latitude != 0 &&
                            business.longitude != 0,
                      )
                      .map(
                        (business) => Marker(
                          point: LatLng(
                            business.latitude,
                            business.longitude,
                          ),
                          width: 120,
                          height: 70,
                          child: BusinessMarker(
                            business: business,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      BusinessDetailScreen(
                                    business: business,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}