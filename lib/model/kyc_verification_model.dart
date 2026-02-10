import 'package:flutter/material.dart';

class KycVerificationModel {
  final String leadingImage;
  final String titleText;
  final String subtitleText;
  final String trailingIcon;
  final Color titleColor;
  final Color subtitleColor;

  KycVerificationModel({
    required this.leadingImage,
    required this.titleText,
    required this.subtitleText,
    required this.trailingIcon,
    required this.titleColor,
    required this.subtitleColor,
  });
}
