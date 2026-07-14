import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/business_repository.dart';
import '../../favorites/providers/favorite_provider.dart';
import '../models/profile_model.dart';

class ProfileData {
  final ProfileModel profile;
  final int favoriteCount;
  final int businessCount;

  const ProfileData({
    required this.profile,
    required this.favoriteCount,
    required this.businessCount,
  });
}

final profileProvider = FutureProvider<ProfileData>((ref) async {
  final profile = ProfileModel.guest();

  final favorites =
      await ref.read(favoriteRepositoryProvider).getFavorites();

  final businesses =
      await BusinessRepository().getAllBusinesses();

  return ProfileData(
    profile: profile,
    favoriteCount: favorites.length,
    businessCount: businesses.length,
  );
});