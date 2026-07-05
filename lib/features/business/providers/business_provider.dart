import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/business_model.dart';
import '../../../repositories/business_repository.dart';

final businessRepositoryProvider =
    Provider<BusinessRepository>((ref) {
  return BusinessRepository();
});

final businessProvider = FutureProvider.family<
    List<BusinessModel>,
    String>((ref, categoryId) async {
  return ref
      .read(businessRepositoryProvider)
      .getBusinessesByCategory(categoryId);
});