import 'package:ppay_mobile/module/settings/data/models/transaction_limit_model.dart';

abstract class TransactionLimitRemoteDataSource {
  Future<TransactionLimitsModel> getTransactionLimits();
}
