import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/business_model.dart';
import '../../../repositories/search_repository.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository();
});

final searchQueryProvider = StateProvider<String>((ref) {
  return '';
});

final searchProvider =
    FutureProvider<List<BusinessModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query.trim().isEmpty) {
    return [];
  }

  return ref
      .read(searchRepositoryProvider)
      .searchBusinesses(query);
});