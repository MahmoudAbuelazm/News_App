class Articlemodel {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? author;
  final String? publishedAt;
  final String? content;
  final String url;

  Articlemodel(
      {required this.title,
      required this.url,
      required this.subtitle,
      required this.image,
      required this.author,
      required this.publishedAt,
      required this.content});
  factory Articlemodel.fromJson(json) {
    return Articlemodel(
      title: json['title'],
      subtitle: json['description'],
      image: json['urlToImage'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      url: json['url'],
    );
  }
}
