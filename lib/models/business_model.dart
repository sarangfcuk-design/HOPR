class BusinessModel {
  final String id;
  final String name;
  final String description;
  final String categoryId;
  final String address;
  final double rating;
  final bool isVerified;
  final bool isFeatured;

  const BusinessModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.address,
    required this.rating,
    required this.isVerified,
    required this.isFeatured,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      categoryId: json['category_id']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isVerified: json['is_verified'] ?? false,
      isFeatured: json['is_featured'] ?? false,
    );
  }
}