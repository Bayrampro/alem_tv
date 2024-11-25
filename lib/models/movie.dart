class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.mainImageUrl,
    required this.m3u8Url,
    required this.rating,
  });

  final int id;
  final String title;
  final String imageUrl;
  final String mainImageUrl;
  final String m3u8Url;
  final double rating;
}
