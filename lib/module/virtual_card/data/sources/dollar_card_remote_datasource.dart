import 'dart:io';

import 'package:ppay_mobile/module/virtual_card/data/models/dollar_card_model.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/dollar_card_transaction_model.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/fund_dollar_card_request.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/withdraw_dollar_card_request.dart';

abstract class DollarCardRemoteDataSource {
  Future<void> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required File photo,
    required File ninPhoto,
  });
  Future<void> addDollarCard({required String brand});
  Future<List<DollarCardModel>> getDollarCards();
  Future<DollarCardModel> getDollarCard({required String cardId});
  Future<void> fundDollarCard({required String cardId, required FundDollarCardRequest request});
  Future<void> withdrawDollarCard({required String cardId, required WithdrawDollarCardRequest request});
  Future<List<DollarCardTransactionModel>> getDollarCardTransactions({required String cardId});
  Future<void> freezeDollarCard({required String cardId});
  Future<void> unfreezeDollarCard({required String cardId});
  Future<void> terminateDollarCard({required String cardId});
}
