import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/views/home_screen.dart';
import 'package:ppay_mobile/screens/views/sub_transaction_screens/airtime_example_screen.dart';
import 'package:ppay_mobile/screens/views/sub_transaction_screens/flight_booking_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TransactionModel {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String imageAsset;
  final Color containerColor;
  final Widget screen;

  TransactionModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.imageAsset,
    required this.screen,
    required this.containerColor,
  });
}

class TransactionDayGroup {
  final String dayLabel; // Today, Yesterday, May 21, etc
  final List<TransactionModel> transactions;

  TransactionDayGroup({required this.dayLabel, required this.transactions});
}

final List<TransactionDayGroup> transactionGroups = [
  TransactionDayGroup(
    dayLabel: 'Today',
    transactions: [
      TransactionModel(
        title: 'Apple',
        subtitle: 'Paid with Dollar Card',
        amount: '-₦60,000.00',
        amountColor: PPaymobileColors.dangerTextColor,
        imageAsset: 'assets/images/apple.png',
        containerColor: PPaymobileColors.deepBackgroundColor,
        screen: const HomeScreen(),
      ),
      TransactionModel(
        title: 'Spotify Subscription',
        subtitle: 'Paid from wallet',
        amount: '-₦60,000.00',
        amountColor: PPaymobileColors.dangerTextColor,
        imageAsset: 'assets/images/spotify.png',
        containerColor: PPaymobileColors.deepBackgroundColor,
        screen: const HomeScreen(),
      ),
      TransactionModel(
        title: 'Deposit to Wallet',
        subtitle: 'May 21, 08:25PM',
        amount: '+₦60,000.00',
        amountColor: Colors.black,
        imageAsset: 'assets/images/logo.png',
        containerColor: PPaymobileColors.backgroundColor,
        screen: const HomeScreen(),
      ),
    ],
  ),

  TransactionDayGroup(
    dayLabel: 'Yesterday',
    transactions: [
      TransactionModel(
        title: 'Netflix',
        subtitle: 'July 23, 02:00PM',
        amount: '₦34,000.00',
        amountColor: Colors.green,
        imageAsset: 'assets/images/netflix.png',
        containerColor: PPaymobileColors.netflixContainerColor,
        screen: const HomeScreen(),
      ),
      TransactionModel(
        title: 'MTN',
        subtitle: 'Airtime Purchase',
        amount: '₦4,000.00',
        amountColor: Colors.green,
        imageAsset: 'assets/images/mtn.png',
        containerColor: Colors.yellow.shade600,
        screen: const AirtimeExampleScreen(),
      ),
      TransactionModel(
        title: 'Airpeace',
        subtitle: 'Flight Ticket',
        amount: '₦204,000.00',
        amountColor: Colors.black,
        imageAsset: 'assets/images/flight_ticket.png',
        containerColor: PPaymobileColors.deepBackgroundColor,
        screen: FlightBookingScreen(),
      ),
      TransactionModel(
        title: 'Sold Gift Card',
        subtitle: 'May 21, 08:25PM',
        amount: '+₦60,000.00',
        amountColor: Colors.black,
        imageAsset: 'assets/images/logo.png',
        containerColor: PPaymobileColors.backgroundColor,
        screen: const HomeScreen(),
      ),
    ],
  ),
];
