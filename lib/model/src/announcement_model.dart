class AnnouncementModel {
  AnnouncementModel({
    required this.publishDate,
    required this.title,
    required this.message,
  });

  final DateTime publishDate;
  final String title;
  final String message;
}
