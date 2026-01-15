import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SelectCryptoModel {
  final String containerImage;
  final String cryptoTitle;
  final String cryptosubTitle;
  final String cryptoPrice;
  final String cryptoStatus;
  final Color cryptoStatusColor;
  final String cryptoStatusIcon;

  SelectCryptoModel({
    required this.containerImage,
    required this.cryptoTitle,
    required this.cryptosubTitle,
    required this.cryptoPrice,
    required this.cryptoStatus,
    required this.cryptoStatusColor,
    required this.cryptoStatusIcon,
  });
}

final List<SelectCryptoModel> selectCrypto = [
  SelectCryptoModel(
    containerImage: 'assets/images/bitcoin.png',
    cryptoTitle: 'Bitcoin',
    cryptosubTitle: '0.000005 BTC',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: '0.09%',
    cryptoStatusColor: PPaymobileColors.cryptoNumbersColor,
    cryptoStatusIcon: 'assets/icon/colored_arrow_down.svg',
  ),
  SelectCryptoModel(
    containerImage: 'assets/images/ethereum.png',
    cryptoTitle: 'Ethereum',
    cryptosubTitle: '0.000005 ETH',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: '0.09%',
    cryptoStatusColor: PPaymobileColors.doneTextColor,
    cryptoStatusIcon: 'assets/icon/colored_arrow_green_up.svg',
  ),
  SelectCryptoModel(
    containerImage: 'assets/images/solana.png',
    cryptoTitle: 'Solana',
    cryptosubTitle: '0.000005 SOL',
    cryptoPrice: '₦34,000.00',
    cryptoStatus: '0.09%',
    cryptoStatusColor: PPaymobileColors.cryptoNumbersColor,
    cryptoStatusIcon: 'assets/icon/colored_arrow_up.svg',
  ),
];
