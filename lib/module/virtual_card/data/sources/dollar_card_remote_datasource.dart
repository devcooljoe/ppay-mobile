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
    required String country,
    required String postalCode,
    required File photo,
  });
  Future<DollarCardModel> getDollarCard();
  Future<void> fundDollarCard(FundDollarCardRequest request);
  Future<void> withdrawDollarCard(WithdrawDollarCardRequest request);
  Future<List<DollarCardTransactionModel>> getDollarCardTransactions();
  Future<void> freezeDollarCard();
  Future<void> unfreezeDollarCard();
  Future<void> terminateDollarCard();
}
