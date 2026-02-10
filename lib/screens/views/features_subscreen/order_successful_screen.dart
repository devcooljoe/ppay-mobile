import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/order_receipt_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/shopping_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/your_order_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class OrderSuccessfulScreen extends StatefulWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  State<OrderSuccessfulScreen> createState() => _OrderSuccessfulScreenState();
}

class _OrderSuccessfulScreenState extends State<OrderSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(
                  'assets/images/success1.png', // for fail use 'assets/images/cancel_1.png' for pending use 'assets/images/failed_1.png'
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Order Placed', // for pending use Order Pending and for failed use Order Failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                'Your order has been successfully placed', // for pending use 'Your order is being processed. Please wait has we process your order' and for failed use 'Transaction failed. There was an issue in your order. Please try again',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              220.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourOrderScreen()),
                  );
                },
                child: SizedBox(
                  height: 51.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/track.png', // for pending use 'assets/images/back_home.png', and for failed use 'assets/images/try_again.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              18.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingScreen()),
                  );
                },
                child: SizedBox(
                  height: 51.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/place_another.png', // for failed use 'assets/images/back_home_1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              10.verticalSpace,
              // adding it but it is not in the UI and i dont know how to access the receipt screen unless i do this
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderReceiptScreen(),
                    ),
                  );
                },
                child: Text(
                  'Access Receipt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
