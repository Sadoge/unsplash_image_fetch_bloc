class UnsplashImage {
  final String id;
  final String description;
  final String imageUrl;
  final String downloadLink;

  UnsplashImage({
    this.id,
    this.description,
    this.imageUrl,
    this.downloadLink,
  });

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      description: json['description'],
      imageUrl: json['urls']['small'],
      downloadLink: json['links']['download'],
    );
  }
}
