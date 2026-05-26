import 'package:ppay_mobile/module/settings/data/models/bank_account_model.dart';
import 'package:ppay_mobile/module/settings/data/models/bank_model.dart';
import 'package:ppay_mobile/module/settings/data/models/requests/update_bank_account_request.dart';

abstract class BankAccountRemoteDataSource {
  Future<List<BankModel>> getBanks();
  Future<List<BankAccountModel>> getBankAccounts();
  Future<void> updateBankAccount(String id, UpdateBankAccountRequest request);
  Future<void> deleteBankAccount(String id);
}
