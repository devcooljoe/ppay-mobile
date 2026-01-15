import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class NotificationModel {
  final Color containerColor;
  final String notifIcon;
  final String notifTitle;
  final String notifSubtitle;
  final String? redirectLink;
  final String notifTime;
  final Color notifLabel;

  NotificationModel({
    required this.containerColor,
    required this.notifIcon,
    required this.notifTitle,
    required this.notifSubtitle,
    this.redirectLink,
    required this.notifTime,
    required this.notifLabel,
  });
}

class NotificationDayGroup {
  final String notifDay;
  final String notifDate;
  final List<NotificationModel> notifDaychild;

  NotificationDayGroup({
    required this.notifDay,
    required this.notifDate,
    required this.notifDaychild,
  });
}

final List<NotificationDayGroup> notifGroup = [
  NotificationDayGroup(
    notifDay: 'Today',
    notifDate: '03/11/2025',
    notifDaychild: [
      NotificationModel(
        containerColor: PPaymobileColors.fundWallet,
        notifIcon: 'assets/icon/wallet.svg',
        notifTitle: 'New Wallet Funding',
        notifSubtitle: 'Your wallet has been funded with ₦56,000.00',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.currentCardColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.currentCardColor,
        notifIcon: 'assets/icon/card.svg',
        notifTitle: 'Dollar Card Activated',
        notifSubtitle:
            'Your dollar card has been successfully created and activated',
        notifTime: '4 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
    ],
  ),
  NotificationDayGroup(
    notifDay: 'Yesterday',
    notifDate: '02/11/2025',
    notifDaychild: [
      NotificationModel(
        containerColor: PPaymobileColors.fundWallet,
        notifIcon: 'assets/icon/airplane.svg',
        notifTitle: 'Flight booking Update',
        notifSubtitle:
            'You have successfully booked a flight from Lagos to Abuja',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
    ],
  ),
  NotificationDayGroup(
    notifDay: 'Yesterday',
    notifDate: '02/11/2025',
    notifDaychild: [
      NotificationModel(
        containerColor: PPaymobileColors.fundWallet,
        notifIcon: 'assets/icon/airplane.svg',
        notifTitle: 'Flight booking Update',
        notifSubtitle:
            'You have successfully booked a flight from Lagos to Abuja',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
    ],
  ),
  NotificationDayGroup(
    notifDay: 'Wednesday',
    notifDate: '01/11/2025',
    notifDaychild: [
      NotificationModel(
        containerColor: PPaymobileColors.withdrawWallet,
        notifIcon: 'assets/icon/wallet.svg',
        notifTitle: 'New Wallet Withdrawal',
        notifSubtitle: '₦56,000.00 has been deducted from your wallet',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.dangerTextColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.btcColor,
        notifIcon: 'assets/icon/btc.svg',
        notifTitle: 'BTC asset successfully sold',
        notifSubtitle: '0.000089BTC has been sold from your wallet',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.userColor,
        notifIcon: 'assets/icon/user.svg',
        notifTitle: 'User KYC update',
        notifSubtitle: 'Your kyc verification was successful',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.dangerTextColor,
      ),
    ],
  ),
  NotificationDayGroup(
    notifDay: 'Tuesday',
    notifDate: '31/10/2025',
    notifDaychild: [
      NotificationModel(
        containerColor: PPaymobileColors.flightColor,
        notifIcon: 'assets/icon/airplane.svg',
        notifTitle: 'Flight Boarding pass update',
        notifSubtitle: 'Your boarding pass is now available.',
        redirectLink: 'Click to View',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.itemsColor,
        notifIcon: 'assets/icon/shop.svg',
        notifTitle: 'Items order placed',
        notifSubtitle: 'You have placed an order for some items.',
        redirectLink: 'Click to View',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.giftCard,
        notifIcon: 'assets/icon/gift_card.svg',
        notifTitle: 'New Gift card sold',
        notifSubtitle: 'You have placed an order for some items.',
        redirectLink: 'Click to View',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
      NotificationModel(
        containerColor: PPaymobileColors.billsColor,
        notifIcon: 'assets/icon/bills.svg',
        notifTitle: 'Bills payment successfully paid',
        notifSubtitle:
            'You have made a payment for electricity bill from your wallet balance',
        notifTime: '2 min Ago',
        notifLabel: PPaymobileColors.deepBackgroundColor,
      ),
    ],
  ),
];
