import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/category_model.dart';

class CategoryRepository {
  final _client = Supabase.instance.client;

  Future<List<CategoryModel>> getCategories() async {
    final List<dynamic> data = await _client
        .from('categories')
        .select('id,name,icon')
        .order('name');

    return data
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}