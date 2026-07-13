class BusinessModel {
  final String id;
  final String name;
  final String description;
  final String categoryId;
  final String address;
  final double rating;
  final bool isVerified;
  final bool isFeatured;

  final String phone;
  final String website;
  final String coverImage;
  final String openingTime;
  final String closingTime;

  const BusinessModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.address,
    required this.rating,
    required this.isVerified,
    required this.isFeatured,
    required this.phone,
    required this.website,
    required this.coverImage,
    required this.openingTime,
    required this.closingTime,
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
      phone: json['phone']?.toString() ?? '',
      website: json['website']?.toString() ?? '',
      coverImage: json['cover_image']?.toString() ?? '',
      openingTime: json['opening_time']?.toString() ?? '',
      closingTime: json['closing_time']?.toString() ?? '',
    );
  }
}