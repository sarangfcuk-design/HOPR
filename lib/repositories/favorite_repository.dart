import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/favorite_model.dart';

class FavoriteRepository {
  final SupabaseClient _client = Supabase.instance.client;

  static const String guestUser = "guest_user";

  Future<void> addFavorite(String businessId) async {
    await _client.from('favorites').insert({
      'user_id': guestUser,
      'business_id': businessId,
    });
  }

  Future<void> removeFavorite(String businessId) async {
    await _client
        .from('favorites')
        .delete()
        .eq('user_id', guestUser)
        .eq('business_id', businessId);
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final List<dynamic> response = await _client
        .from('favorites')
        .select()
        .eq('user_id', guestUser)
        .order('created_at', ascending: false);

    return response
        .map(
          (e) => FavoriteModel.fromJson(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<bool> isFavorite(String businessId) async {
    final List<dynamic> response = await _client
        .from('favorites')
        .select()
        .eq('user_id', guestUser)
        .eq('business_id', businessId);

    return response.isNotEmpty;
  }
}