import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/business_model.dart';

class SearchRepository {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<BusinessModel>> searchBusinesses(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    final List<dynamic> response = await _client
        .from('businesses')
        .select()
        .ilike('name', '%$query%')
        .order('rating', ascending: false);

    return response
        .map(
          (e) => BusinessModel.fromJson(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}