// ignore_for_file: public_member_api_docs, sort_constructors_first

class ArticleModel {
  String title;
  String description;
  String url;
  String urlToImage;
  ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  ArticleModel copyWith({
    String? title,
    String? description,
    String? url,
    String? urlToImage,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
    );
  }
}
