import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CryptoTransactionsModel {
  final String containerImage;
  final String cryptoTitle;
  final String cryptosubTitle;
  final String cryptoPrice;
  final String cryptoStatus;
  final Color cryptoStatusColor;

  CryptoTransactionsModel({
    required this.containerImage,
    required this.cryptoTitle,
    required this.cryptosubTitle,
    required this.cryptoPrice,
    required this.cryptoStatus,
    required this.cryptoStatusColor,
  });
}

final List<CryptoTransactionsModel> cryptoTransaction = [
  CryptoTransactionsModel(
    containerImage: 'assets/images/bitcoin.png',
    cryptoTitle: 'Bitcoin',
    cryptosubTitle: '0.000005 BTC',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: 'Purchased',
    cryptoStatusColor: PPaymobileColors.doneTextColor,
  ),
  CryptoTransactionsModel(
    containerImage: 'assets/images/ethereum.png',
    cryptoTitle: 'Ethereum',
    cryptosubTitle: '0.000005 ETH',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: 'Sold',
    cryptoStatusColor: PPaymobileColors.cryptoNumbersColor,
  ),
  CryptoTransactionsModel(
    containerImage: 'assets/images/solana.png',
    cryptoTitle: 'Solana',
    cryptosubTitle: '0.000005 SOL',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: 'Purchased',
    cryptoStatusColor: PPaymobileColors.doneTextColor,
  ),
];
