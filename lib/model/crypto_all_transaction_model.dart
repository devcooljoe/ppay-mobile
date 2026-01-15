import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CryptoAllTransactionModel {
  final String containerImage;
  final String cryptoTitle;
  final String cryptosubTitle;
  final String cryptoPrice;
  final String cryptoStatus;
  final Color cryptoStatusColor;

  CryptoAllTransactionModel({
    required this.containerImage,
    required this.cryptoTitle,
    required this.cryptosubTitle,
    required this.cryptoPrice,
    required this.cryptoStatus,
    required this.cryptoStatusColor,
  });
}

class CryptoAllTransactionDayGroup {
  final String transactionDay; // Today, Yesterday,
  final List<CryptoAllTransactionModel> tDay;

  CryptoAllTransactionDayGroup({
    required this.transactionDay,
    required this.tDay,
  });
}

final List<CryptoAllTransactionDayGroup> cryptoTransactionDay = [
  CryptoAllTransactionDayGroup(
    transactionDay: 'Today',
    tDay: [
      CryptoAllTransactionModel(
        containerImage: 'assets/images/bitcoin.png',
        cryptoTitle: 'Bitcoin',
        cryptosubTitle: '0.000005 BTC',
        cryptoPrice: '₦34,000.00',
        cryptoStatus: 'Purchased',
        cryptoStatusColor: PPaymobileColors.doneTextColor,
      ),
      CryptoAllTransactionModel(
        containerImage: 'assets/images/ethereum.png',
        cryptoTitle: 'Ethereum',
        cryptosubTitle: '0.000005 ETH',
        cryptoPrice: '₦34,000.00',
        cryptoStatus: 'Sold',
        cryptoStatusColor: PPaymobileColors.cryptoNumbersColor,
      ),
    ],
  ),
  CryptoAllTransactionDayGroup(
    transactionDay: 'Yesterday',
    tDay: [
      CryptoAllTransactionModel(
        containerImage: 'assets/images/solana.png',
        cryptoTitle: 'Solana',
        cryptosubTitle: '0.000005 SOL',
        cryptoPrice: '₦34,000.00',
        cryptoStatus: 'Purchased',
        cryptoStatusColor: PPaymobileColors.doneTextColor,
      ),
    ],
  ),
];
