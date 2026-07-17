import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';

abstract class SupportTicketRepository {
  Future<Either<Failure, SupportTicketEntity>> createTicket({
    required String subject,
    required String category,
    required String message,
    required bool isUrgent,
  });

  Future<Either<Failure, List<SupportTicketEntity>>> getMyTickets();

  Future<Either<Failure, List<SupportMessageEntity>>> getTicketMessages(String ticketId);

  Future<Either<Failure, SupportMessageEntity>> sendMessage(String ticketId, String body);
}
