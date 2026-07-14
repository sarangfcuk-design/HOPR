class AppUser {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory AppUser.fromGoogle({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
  }) {
    return AppUser(
      id: id,
      name: name,
      email: email,
      photoUrl: photoUrl,
    );
  }
}