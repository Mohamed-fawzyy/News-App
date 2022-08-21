import 'dart:convert';

class Article {
  String title;
  String url;
  String urlToImage;

  Article(
    this.title,
    this.url,
    this.urlToImage,
  );

  Article copyWith({
    String? title,
    String? url,
    String? urlToImage,
  }) {
    return Article(
      title ?? this.title,
      url ?? this.url,
      urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      map['title'] ?? 'nothing',
      map['url'] ?? 'nothing',
      map['urlToImage'] ?? 'nothing',
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() =>
      'Article(title: $title, url: $url, urlToImage: $urlToImage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.title == title &&
        other.url == url &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ urlToImage.hashCode;
}
