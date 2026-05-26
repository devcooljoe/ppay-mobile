import 'package:ppay_mobile/module/bills/data/models/bill_model.dart';
import 'package:ppay_mobile/module/bills/data/models/requests/bill_request.dart';

abstract class BillPaymentRemoteDataSource {
  Future<List<BillerModel>> getAirtimeBillers();
  Future<List<BillerModel>> getDataBillers();
  Future<List<BillerModel>> getElectricityBillers();
  Future<List<BillerModel>> getBettingBillers();
  Future<List<BillerModel>> getTvBillers();
  Future<CustomerVerificationModel> verifyCustomer(VerifyBillCustomerRequest request);
  Future<BillPurchaseModel> purchaseBill(PurchaseBillRequest request);
}
