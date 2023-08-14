// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  String? imageUrl;
  String? categoryName;
  CategoryModel({
    required this.imageUrl,
    required this.categoryName,
  });

  CategoryModel copyWith({
    String? imageUrl,
    String? categoryName,
  }) {
    return CategoryModel(
      imageUrl: imageUrl ?? this.imageUrl,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      imageUrl: map['imageUrl'],
      categoryName: map['categoryName'],
    );
  }
}
