class Course {
  final String id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final int lessonCount;
  final double progress;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.lessonCount = 0,
    this.progress = 0.0,
  });
}