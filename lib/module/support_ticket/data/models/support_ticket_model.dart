import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';

class SupportTicketModel {
  final String id;
  final String subject;
  final String category;
  final String status;
  final bool isUrgent;
  final int unreadUserCount;
  final int unreadAdminCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SupportTicketModel({
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

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) {
    return SupportTicketModel(
      id: json['id'] as String,
      subject: json['subject'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
      isUrgent: json['isUrgent'] as bool? ?? false,
      unreadUserCount: json['unreadUserCount'] as int? ?? 0,
      unreadAdminCount: json['unreadAdminCount'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  SupportTicketEntity toEntity() => SupportTicketEntity(
        id: id,
        subject: subject,
        category: category,
        status: status,
        isUrgent: isUrgent,
        unreadUserCount: unreadUserCount,
        unreadAdminCount: unreadAdminCount,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class SupportMessageModel {
  final String id;
  final String body;
  final String sender;
  final DateTime createdAt;

  const SupportMessageModel({
    required this.id,
    required this.body,
    required this.sender,
    required this.createdAt,
  });

  factory SupportMessageModel.fromJson(Map<String, dynamic> json) {
    return SupportMessageModel(
      id: json['id'] as String,
      body: json['body'] as String,
      sender: json['sender'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  SupportMessageEntity toEntity() => SupportMessageEntity(
        id: id,
        body: body,
        sender: sender,
        createdAt: createdAt,
      );
}
