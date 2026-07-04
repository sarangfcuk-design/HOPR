import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/category_model_old.dart';
import '../../../repositories/category_repository_old.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final categoryProvider =
    FutureProvider<List<CategoryModel>>((ref) async {
  return ref.read(categoryRepositoryProvider).getCategories();
});