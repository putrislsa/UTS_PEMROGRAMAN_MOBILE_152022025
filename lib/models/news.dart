class News {
  final String title;
  final String teaser;
  final String time;
  final String? category;

  News({
    required this.title,
    required this.teaser,
    required this.time,
    this.category,
  });
}
