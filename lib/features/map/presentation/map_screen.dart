import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/services/url_launcher_service.dart';
import '../../business/presentation/business_detail_screen.dart';
import '../providers/map_provider.dart';
import '../widgets/business_bottom_sheet.dart';
import '../widgets/business_marker.dart';
import '../widgets/map_search_bar.dart';
import '../widgets/current_location_marker.dart';
import '../widgets/map_fab.dart';
import '../widgets/category_chips_bar.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapData = ref.watch(mapProvider);

    return Scaffold(
      body: mapData.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),

        data: (data) {
          final launcher = UrlLauncherService();

          return Stack(
            children: [

              FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(
                    data.currentLocation.latitude,
                    data.currentLocation.longitude,
                  ),

                  initialZoom: 14,

                  minZoom: 3,

                  maxZoom: 19,

                  interactionOptions:
                      const InteractionOptions(
                    flags:
                        InteractiveFlag.all,
                  ),

                  onPositionChanged:
                      (position, hasGesture) {
                    if (hasGesture) {
                      debugPrint(
                        "Center : ${position.center}",
                      );
                    }
                  },
                ),

                children: [

                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

                    userAgentPackageName:
                        "com.example.hopr",
                  ),

                  MarkerLayer(
                    markers: [

                      /// USER LOCATION

                      Marker(
                        point: LatLng(
                          data.currentLocation.latitude,
                          data.currentLocation.longitude,
                        ),

                        width: 50,

                        height: 50,

                        child: const CurrentLocationMarker(),
                      ),

                      /// BUSINESS MARKERS

                      ...data.businesses
                          .where(
                            (business) =>
                                business.latitude !=
                                    0 &&
                                business.longitude !=
                                    0,
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

                                    isScrollControlled:
                                        true,

                                    useSafeArea:
                                        true,

                                    backgroundColor:
                                        Colors.white,

                                    shape:
                                        const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.vertical(
                                        top:
                                            Radius.circular(
                                          24,
                                        ),
                                      ),
                                    ),

                                    builder: (_) {

                                      return BusinessBottomSheet(

                                        business:
                                            business,

                                        onCall:
                                            () async {

                                          Navigator.pop(
                                            context,
                                          );

                                          await launcher
                                              .call(
                                            business
                                                .phone,
                                          );
                                        },

                                        onDirections:
                                            () async {

                                          Navigator.pop(
                                            context,
                                          );

                                          await launcher
                                              .directions(
                                                                                           business
                                                .latitude,
                                            business
                                                .longitude,
                                          );
                                        },

                                        onDetails:
                                            () {

                                          Navigator.pop(
                                            context,
                                          );

                                          Navigator.push(
                                            context,

                                            MaterialPageRoute(
                                              builder:
                                                  (_) =>
                                                      BusinessDetailScreen(
                                                business:
                                                    business,
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
              ),

              MapSearchBar(
                onTap: () {

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(

                      content: Text(
                        "Search feature coming soon 🚀",
                      ),

                    ),

                  );
                },
              ),
              
const CategoryChipsBar(),

              MapFab(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Live recenter coming soon 🚀",
        ),
      ),
    );
  },
),
            ],
          );
        },
      ),
    );
  }
} 