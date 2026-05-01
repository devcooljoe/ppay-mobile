import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class BookingPoliciesPage extends StatefulWidget {
  const BookingPoliciesPage({super.key});

  @override
  State<BookingPoliciesPage> createState() => _BookingPoliciesPageState();
}

class _BookingPoliciesPageState extends State<BookingPoliciesPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          40.verticalSpace,
          Text(
            'Booking Policies',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          28.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 18.h,
                width: 16.h,
                child: SvgPicture.asset(
                  'assets/icon/tick_1.svg',
                  fit: BoxFit.contain,
                ),
              ),
              6.horizontalSpace,
              Text(
                'Ticket issuing time',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Text(
            'Once payment is confirmed, ticket will be issued within 2 days',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 18.h,
                width: 16.h,
                child: SvgPicture.asset(
                  'assets/icon/tick_1.svg',
                  fit: BoxFit.contain,
                ),
              ),
              6.horizontalSpace,
              Text(
                'Adult + Child/infant Tickets',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Text(
            'When adult tickets are booked together with child or infant tickets, tickets will be issued separately based on the passenger type. Cancellations and changes of tickets that have already been issued must also be made separately by passenger type. Fees will be charged in accordance with the policy of each ticket',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
