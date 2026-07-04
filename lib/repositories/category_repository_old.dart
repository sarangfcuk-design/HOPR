import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/category_model_old.dart';

class CategoryRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabase
        .from('categories')
        .select()
        .order('name');

    return (response as List)
        .map((e) => CategoryModel.fromMap(e))
        .toList();
  }
}