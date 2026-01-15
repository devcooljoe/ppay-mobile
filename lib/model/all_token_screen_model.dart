import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TokenDetailModel {
  final String tokenName;
  final String tokenImage;
  final String totalAmount;
  final String increaseAmount;
  final String increasePercent;
  final String increaseSvgIcon;
  final String availableBalance;
  final String availableCrypto;

  final List<TokenTransactionGroup> transactionGroups;

  TokenDetailModel({
    required this.tokenName,
    required this.tokenImage,
    required this.totalAmount,
    required this.increaseAmount,
    required this.increasePercent,
    required this.increaseSvgIcon,
    required this.availableBalance,
    required this.availableCrypto,
    required this.transactionGroups,
  });
}

class TokenTransactionGroup {
  final String day;
  final List<TokenTransactionModel> transactions;

  TokenTransactionGroup({required this.day, required this.transactions});
}

class TokenTransactionModel {
  final String tokenName;
  final String tokenAmount;
  final String transactionPrice;

  final String status; // Purchased / Sold
  final Color statusColor;

  final String leadingIcon;
  final Color leadingIconBg;

  TokenTransactionModel({
    required this.tokenName,
    required this.tokenAmount,
    required this.transactionPrice,
    required this.status,
    required this.statusColor,
    required this.leadingIcon,
    required this.leadingIconBg,
  });
}

final bitcoinDetail = TokenDetailModel(
  tokenName: 'Bitcoin',
  tokenImage: 'assets/images/bitcoin.png',
  totalAmount: '₦145,000,000.00',
  increaseAmount: '₦45,000',
  increasePercent: '0.09%',
  increaseSvgIcon: 'assets/icon/colored_arrow_green_up.svg',
  availableBalance: '₦150,000',
  availableCrypto: '0.000023BTC',
  transactionGroups: [
    TokenTransactionGroup(
      day: 'Today',
      transactions: [
        TokenTransactionModel(
          tokenName: 'Bitcoin',
          tokenAmount: '0.000048BTC',
          transactionPrice: '+₦34,000.00',
          status: 'Purchased',
          statusColor: PPaymobileColors.buttonColor,
          leadingIcon: 'assets/icon/arrow_side_down.svg',
          leadingIconBg: PPaymobileColors.doneColor,
        ),
        TokenTransactionModel(
          tokenName: 'Bitcoin',
          tokenAmount: '0.000048BTC',
          transactionPrice: '-₦124,000.00',
          status: 'Sold',
          statusColor: PPaymobileColors.cryptoNumbersColor,
          leadingIcon: 'assets/icon/arrow_side_up.svg',
          leadingIconBg: PPaymobileColors.warningColor,
        ),
      ],
    ),
    TokenTransactionGroup(
      day: 'Yesterday',
      transactions: [
        TokenTransactionModel(
          tokenName: 'Bitcoin',
          tokenAmount: '0.000048BTC',
          transactionPrice: '+₦34,000.00',
          status: 'Purchased',
          statusColor: PPaymobileColors.cryptoNumbersColor,
          leadingIcon: 'assets/icon/arrow_side_up.svg',
          leadingIconBg: PPaymobileColors.warningColor,
        ),
      ],
    ),
  ],
);
