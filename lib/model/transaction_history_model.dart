import 'package:flutter/material.dart';

class TransactionHistoryModel {
  final String leadingImage;
  final String titleText;
  final String subtitleText;
  final String trailingText;
  final Color trailingColor;

  TransactionHistoryModel({
    required this.leadingImage,
    required this.titleText,
    required this.subtitleText,
    required this.trailingText,
    required this.trailingColor,
  });
}
