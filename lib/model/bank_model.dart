class BankModel {
  final String bankImage;
  final String bankName;

  BankModel({required this.bankImage, required this.bankName});
}

List banksModel = [
  BankModel(bankImage: 'assets/images/gt_bank.png', bankName: 'GT Bank'),
  BankModel(
    bankImage: 'assets/images/access_bank.png',
    bankName: 'Access Bank',
  ),
  BankModel(
    bankImage: 'assets/images/fidelity_bank.png',
    bankName: 'Fidelity Bank',
  ),
  BankModel(bankImage: 'assets/images/first_bank.png', bankName: 'First Bank'),
];
