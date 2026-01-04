import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/views/review_document_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/profile_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/settings_options_sub_screen/privacy_screen.dart';

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
        optionIcon: 'assets/icon/person.svg',
        optionTitle: 'Profile',
        optionScreen: ProfileScreen(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/id.svg',
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
        optionIcon: 'assets/icon/key_black.svg',
        optionTitle: 'Change Transaction Pin',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/biometric.svg',
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
        optionIcon: 'assets/icon/transaction.svg',
        optionTitle: 'Transaction Limit',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Referral',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/multiple_person.svg',
        optionTitle: 'Refer & Earn',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Teams & Support',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/terms.svg',
        optionTitle: 'Terms & Conditions',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/privacy.svg',
        optionTitle: 'Privacy Policy',
        optionScreen: PrivacyScreen(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/help.svg',
        optionTitle: 'Help & Support',
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Sign Out',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/logout.svg',
        optionTitle: 'Logout',
      ),
    ],
  ),
];
