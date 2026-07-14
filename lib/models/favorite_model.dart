class FavoriteModel {
  final String id;
  final String userId;
  final String businessId;
  final DateTime createdAt;

  const FavoriteModel({
    required this.id,
    required this.userId,
    required this.businessId,
    required this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id']?.toString() ?? '',
      userId: json['user_id']?.toString() ?? '',
      businessId: json['business_id']?.toString() ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'business_id': businessId,
    };
  }
}