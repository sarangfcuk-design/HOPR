import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/favorite_model.dart';
import '../../../repositories/favorite_repository.dart';

final favoriteRepositoryProvider =
    Provider((ref) => FavoriteRepository());

class FavoriteNotifier
    extends StateNotifier<AsyncValue<List<FavoriteModel>>> {
  FavoriteNotifier(this._repository)
      : super(const AsyncLoading()) {
    loadFavorites();
  }

  final FavoriteRepository _repository;

  Future<void> loadFavorites() async {
    try {
      final data = await _repository.getFavorites();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addFavorite(String businessId) async {
    await _repository.addFavorite(businessId);
    await loadFavorites();
  }

  Future<void> removeFavorite(String businessId) async {
    await _repository.removeFavorite(businessId);
    await loadFavorites();
  }

  bool isFavorite(String businessId) {
    return state.value?.any(
          (e) => e.businessId == businessId,
        ) ??
        false;
  }
}

final favoriteProvider = StateNotifierProvider<
    FavoriteNotifier,
    AsyncValue<List<FavoriteModel>>>((ref) {
  return FavoriteNotifier(
    ref.read(favoriteRepositoryProvider),
  );
});