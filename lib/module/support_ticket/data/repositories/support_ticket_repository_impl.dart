import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/support_ticket/data/sources/support_ticket_remote_datasource.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';
import 'package:ppay_mobile/module/support_ticket/domain/repositories/support_ticket_repository.dart';

@LazySingleton(as: SupportTicketRepository)
class SupportTicketRepositoryImpl implements SupportTicketRepository {
  final SupportTicketRemoteDataSource _dataSource;

  SupportTicketRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, SupportTicketEntity>> createTicket({
    required String subject,
    required String category,
    required String message,
    required bool isUrgent,
  }) async {
    try {
      final model = await _dataSource.createTicket(
        subject: subject,
        category: category,
        message: message,
        isUrgent: isUrgent,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<SupportTicketEntity>>> getMyTickets() async {
    try {
      final models = await _dataSource.getMyTickets();
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<SupportMessageEntity>>> getTicketMessages(String ticketId) async {
    try {
      final models = await _dataSource.getTicketMessages(ticketId);
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, SupportMessageEntity>> sendMessage(String ticketId, String body) async {
    try {
      final model = await _dataSource.sendMessage(ticketId, body);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
