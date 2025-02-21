class ArticleModel {
  final String title;
  final String url;
  final String byline;
  final String publishedDate;
  final String abstract;
  final String? imageUrl;

  ArticleModel({
    required this.title,
    required this.url,
    required this.byline,
    required this.publishedDate,
    required this.abstract,
    this.imageUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    String? imageUrl;
    if (json['media'] != null && json['media'].isNotEmpty) {
      var mediaMetadata = json['media'][0]['media-metadata'];
      if (mediaMetadata != null && mediaMetadata.isNotEmpty) {
        imageUrl = mediaMetadata.last['url'];
      }
    }

    return ArticleModel(
      title: json['title'] ?? 'No Title',
      url: json['url'] ?? '',
      byline: json['byline'] ?? 'Unknown Author',
      publishedDate: json['published_date'] ?? '',
      abstract: json['abstract'] ?? '',
      imageUrl: imageUrl,
    );
  }
}
