class NotificationModel {
  final String title;
  final String subtitle;
  final String timeOrDate;
  final String svg; // <-- SVG or image path
  final bool isUnread;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.timeOrDate,
    required this.svg,
    this.isUnread = true,
  });
}
