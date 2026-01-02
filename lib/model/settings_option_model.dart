import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/views/review_document_screen.dart';

class SettingsOptionModel {
  final String optionIcon;
  final String optionTitle;
  final String? trailingIcon;
  final Widget? optionScreen;

  SettingsOptionModel({
    this.optionScreen,
    this.trailingIcon,
    required this.optionIcon,
    required this.optionTitle,
  });
}

class SettingsOptionGroup {
  final String optionGroup; // Today, Yesterday,
  final List<SettingsOptionModel> group;

  SettingsOptionGroup({required this.optionGroup, required this.group});
}

final List<SettingsOptionGroup> settingsGroup = [
  SettingsOptionGroup(
    optionGroup: 'Manage Account',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/person.svg',
        optionTitle: 'Profile',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/id.svg',
        optionTitle: 'Kyc Verification',
        optionScreen: ReviewDocumentScreen(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/bank_black.svg',
        optionTitle: 'Saved Bank Accounts',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Security & Notification Setting',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/lock.svg',
        optionTitle: 'Change Password',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/key_black.svg',
        optionTitle: 'Change Transaction Pin',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/biometric.svg',
        optionTitle: 'Enable Biometric',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/notif.svg',
        optionTitle: 'Notification Settings',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Account Limit',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/transaction.svg',
        optionTitle: 'Transaction Limit',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Referral',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/multiple_person.svg',
        optionTitle: 'Refer & Earn',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Teams & Support',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/terms.svg',
        optionTitle: 'Terms & Conditions',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/privacy.svg',
        optionTitle: 'Privacy Policy',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/help.svg',
        optionTitle: 'Help & Support',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Sign Out',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/settings/logout.svg',
        optionTitle: 'Logout',
      ),
    ],
  ),
];
