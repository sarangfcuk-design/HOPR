import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/business_model.dart';

class BusinessRepository {
  final _client = Supabase.instance.client;

  Future<List<BusinessModel>> getBusinessesByCategory(
      String categoryId) async {
    final List<dynamic> data = await _client
        .from('businesses')
        .select()
        .eq('category_id', categoryId)
        .order('name');

    return data
        .map((e) => BusinessModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}