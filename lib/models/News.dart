class News {
  final String name;
  final String url;
  final String description;
  final DateTime datePublished;
  final String company;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;

  News(
      {this.name,
      this.url,
      this.description,
      this.datePublished,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.company});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        name: json['name'],
        url: json['url'],
        description: json['description'],
        datePublished: DateTime.parse(json['datePublished']),
        imageUrl: json['image']['thumbnail']['contentUrl'],
        imageWidth: json['image']['thumbnail']['width'],
        imageHeight: json['image']['thumbnail']['height'],
        company: List.from(json['provider']).length > 0
            ? json['provider'][0]['name']
            : null);
  }
}
