class BankAccountsModel {
  final String bankImage;
  final String bankName;
  final String accountNumber;
  final String accountName;

  BankAccountsModel({
    required this.bankImage,
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
  });
}

List banksaccountModel = [
  BankAccountsModel(
    bankImage: 'assets/images/gt_bank.png',
    bankName: 'GT Bank',
    accountName: 'Adebami Samuel',
    accountNumber: '9087976570',
  ),
  BankAccountsModel(
    bankImage: 'assets/images/access_bank.png',
    bankName: 'Access Bank',
    accountName: 'Adebami Samuel',
    accountNumber: '9087976570',
  ),
  BankAccountsModel(
    bankImage: 'assets/images/fidelity_bank.png',
    bankName: 'Fidelity Bank',
    accountName: 'Adebami Samuel',
    accountNumber: '9087976570',
  ),
  BankAccountsModel(
    bankImage: 'assets/images/first_bank.png',
    bankName: 'First Bank',
    accountName: 'Adebami Samuel',
    accountNumber: '9087976570',
  ),
];
