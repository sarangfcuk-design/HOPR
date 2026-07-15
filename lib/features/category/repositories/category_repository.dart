import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/category_model.dart';

class CategoryRepository {
  final SupabaseClient _supabase =
      Supabase.instance.client;

  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabase
        .from('categories')
        .select()
        .eq('is_active', true)
        .order('name');

    return response
        .map<CategoryModel>(
          (e) => CategoryModel.fromMap(e),
        )
        .toList();
  }
}