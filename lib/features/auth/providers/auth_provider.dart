import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/auth_repository.dart';
import '../models/app_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthNotifier extends StateNotifier<AppUser?> {
  AuthNotifier(this._repository) : super(_repository.getCurrentUser()) {
    _listenAuthState();
  }

  final AuthRepository _repository;
  StreamSubscription<AuthState>? _subscription;

  void _listenAuthState() {
    _subscription =
        _repository.authStateChanges().listen((_) {
      state = _repository.getCurrentUser();
    });
  }

  Future<void> signInWithGoogle() async {
    await _repository.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _repository.signOut();
    state = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AppUser?>((ref) {
  return AuthNotifier(
    ref.read(authRepositoryProvider),
  );
});