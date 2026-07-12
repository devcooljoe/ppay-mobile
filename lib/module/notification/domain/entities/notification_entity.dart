class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final String status;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.status,
    required this.createdAt,
  });
}
