import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/app_user.dart';
import '../services/google_auth_service.dart';

class AuthRepository {
  final GoogleAuthService _service = GoogleAuthService();

  Future<bool> signInWithGoogle() async {
    return await _service.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _service.signOut();
  }

  AppUser? getCurrentUser() {
    final User? user = _service.currentUser;

    if (user == null) return null;

    return AppUser.fromGoogle(
      id: user.id,
      name: user.userMetadata?['full_name'] ??
          user.userMetadata?['name'] ??
          "Guest",
      email: user.email ?? "",
      photoUrl: user.userMetadata?['avatar_url'],
    );
  }

  Stream<AuthState> authStateChanges() {
    return _service.authStateChanges;
  }
}