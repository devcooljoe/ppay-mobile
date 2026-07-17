import 'package:ppay_mobile/module/support_ticket/data/models/support_ticket_model.dart';

abstract class SupportTicketRemoteDataSource {
  Future<SupportTicketModel> createTicket({
    required String subject,
    required String category,
    required String message,
    required bool isUrgent,
  });

  Future<List<SupportTicketModel>> getMyTickets();

  Future<List<SupportMessageModel>> getTicketMessages(String ticketId);

  Future<SupportMessageModel> sendMessage(String ticketId, String body);
}
