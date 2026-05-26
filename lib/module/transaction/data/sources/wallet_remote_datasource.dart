import 'package:ppay_mobile/module/transaction/data/models/name_enquiry_model.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/name_enquiry_request.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/withdraw_request.dart';
import 'package:ppay_mobile/module/transaction/data/models/wallet_model.dart';

abstract class WalletRemoteDataSource {
  Future<WalletModel> getWallet();
  Future<NameEnquiryModel> nameEnquiry(NameEnquiryRequest request);
  Future<void> withdraw(WithdrawRequest request);
}
