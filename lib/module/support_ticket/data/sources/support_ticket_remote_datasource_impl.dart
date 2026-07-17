import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/module/support_ticket/data/models/support_ticket_model.dart';
import 'package:ppay_mobile/module/support_ticket/data/sources/support_ticket_remote_datasource.dart';

@LazySingleton(as: SupportTicketRemoteDataSource)
class SupportTicketRemoteDataSourceImpl implements SupportTicketRemoteDataSource {
  final Dio _dio;
  static const String _base = '/api/v1/support-tickets';

  SupportTicketRemoteDataSourceImpl(this._dio);

  @override
  Future<SupportTicketModel> createTicket({
    required String subject,
    required String category,
    required String message,
    required bool isUrgent,
  }) async {
    final response = await _dio.post(_base, data: {
      'subject': subject,
      'category': category,
      'message': message,
      'isUrgent': isUrgent,
    });
    return SupportTicketModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<SupportTicketModel>> getMyTickets() async {
    final response = await _dio.get(_base);
    final list = response.data['data'] as List<dynamic>;
    return list.map((e) => SupportTicketModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<SupportMessageModel>> getTicketMessages(String ticketId) async {
    final response = await _dio.get('$_base/$ticketId/messages');
    final data = response.data['data'] as Map<String, dynamic>;
    final list = data['messages'] as List<dynamic>;
    return list.map((e) => SupportMessageModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<SupportMessageModel> sendMessage(String ticketId, String body) async {
    final response = await _dio.post('$_base/$ticketId/messages', data: {'body': body});
    return SupportMessageModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
