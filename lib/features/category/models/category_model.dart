class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final String? image;
  final bool isActive;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.image,
    required this.isActive,
  });

  factory CategoryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      icon: map['icon'] ?? '',
      image: map['image'],
      isActive: map['is_active'] ?? true,
    );
  }
}