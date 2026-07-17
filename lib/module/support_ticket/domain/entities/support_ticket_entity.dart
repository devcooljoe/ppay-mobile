class SupportTicketEntity {
  final String id;
  final String subject;
  final String category;
  final String status;
  final bool isUrgent;
  final int unreadUserCount;
  final int unreadAdminCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SupportTicketEntity({
    required this.id,
    required this.subject,
    required this.category,
    required this.status,
    required this.isUrgent,
    required this.unreadUserCount,
    required this.unreadAdminCount,
    required this.createdAt,
    required this.updatedAt,
  });
}

class SupportMessageEntity {
  final String id;
  final String body;
  final String sender; // 'user' | 'admin'
  final DateTime createdAt;

  const SupportMessageEntity({
    required this.id,
    required this.body,
    required this.sender,
    required this.createdAt,
  });
}
