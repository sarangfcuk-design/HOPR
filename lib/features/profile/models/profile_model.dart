class ProfileModel {
  final String name;
  final String email;
  final String avatarUrl;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory ProfileModel.guest() {
    return const ProfileModel(
      name: "Guest User",
      email: "guest@hopr.app",
      avatarUrl: "",
    );
  }
}