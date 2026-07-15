import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../business/presentation/business_detail_screen.dart';
import '../../../core/services/url_launcher_service.dart';
import '../widgets/business_bottom_sheet.dart';
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
          final launcher = UrlLauncherService();
          return FlutterMap(
            options: MapOptions(
  initialCenter: LatLng(
    data.currentLocation.latitude,
    data.currentLocation.longitude,
  ),

  initialZoom: 14,

  onPositionChanged: (position, hasGesture) {
    if (hasGesture) {
      debugPrint(
        "Map Center : ${position.center}",
      );
    }
  },
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
  showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(24),
    ),
  ),
  builder: (_) {
    return BusinessBottomSheet(
      business: business,

      onCall: () async {
        Navigator.pop(context);

        await launcher.call(
          business.phone,
        );
      },

      onDirections: () async {
        Navigator.pop(context);

        await launcher.directions(
          business.latitude,
          business.longitude,
        );
      },

      onDetails: () {
        Navigator.pop(context);

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