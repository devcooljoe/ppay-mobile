import 'package:flutter/material.dart';
import 'package:ppay_mobile/module/kyc/review_document_page.dart';
import 'package:ppay_mobile/module/settings/bank_account_page.dart';
import 'package:ppay_mobile/module/settings/change_password_page.dart';
import 'package:ppay_mobile/module/settings/help_and_support_page.dart';
import 'package:ppay_mobile/module/settings/notification_page.dart';
import 'package:ppay_mobile/module/settings/pin_reset_page.dart';
import 'package:ppay_mobile/module/settings/privacy_page.dart';
import 'package:ppay_mobile/module/settings/profile_page.dart';
import 'package:ppay_mobile/module/settings/refer_page.dart';
import 'package:ppay_mobile/module/settings/terms_and_condition_page.dart';
import 'package:ppay_mobile/module/settings/transaction_limit_page.dart';

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
        optionScreen: ProfilePage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/id.svg',
        optionTitle: 'Kyc Verification',
        optionScreen: ReviewDocumentPage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/bank_black.svg',
        optionTitle: 'Saved Bank Accounts',
        optionScreen: BankAccountPage(),
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Security & Notification Setting',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/lock.svg',
        optionTitle: 'Change Password',
        optionScreen: ChangePasswordPage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/key_black.svg',
        optionTitle: 'Change Transaction Pin',
        optionScreen: PinResetPage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/biometric_finger.svg',
        optionTitle: 'Enable Biometric',
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/notif.svg',
        optionTitle: 'Notification Settings',
        optionScreen: NotificationPage(),
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Account Limit',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/transaction.svg',
        optionTitle: 'Transaction Limit',
        optionScreen: TransactionLimitPage(),
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Referral',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/multiple_person.svg',
        optionTitle: 'Refer & Earn',
        optionScreen: ReferPage(),
      ),
    ],
  ),
  SettingsOptionGroup(
    optionGroup: 'Teams & Support',
    group: [
      SettingsOptionModel(
        optionIcon: 'assets/icon/terms.svg',
        optionTitle: 'Terms & Conditions',
        optionScreen: TermsAndConditionPage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/privacy.svg',
        optionTitle: 'Privacy Policy',
        optionScreen: PrivacyPage(),
      ),
      SettingsOptionModel(
        optionIcon: 'assets/icon/help.svg',
        optionTitle: 'Help & Support',
        optionScreen: HelpAndSupportPage(),
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
