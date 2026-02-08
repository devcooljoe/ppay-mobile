import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/create_virtual_card.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class VirtualCard extends StatefulWidget {
  const VirtualCard({super.key});

  @override
  State<VirtualCard> createState() => _VirtualCardState();
}

class _VirtualCardState extends State<VirtualCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Virtual Card',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
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
              28.verticalSpace,
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0.w),
                    child: Container(
                      height: 256.h,
                      width: 256.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PPaymobileColors.deepBackgroundColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 26.w,
                    child: SizedBox(
                      height: 250.71.h,
                      width: 354.w,
                      child: Image.asset(
                        'assets/images/dollar_card.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              37.verticalSpace,
              Text(
                'Spend Globally. Pay Securely. Control Everything',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              23.verticalSpace,
              Text(
                'Activate a virtual USD card in seconds to make international payments, shop online, subscribe to apps, and more without bank visits.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              109.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24).r,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateVirtualCard(),
                      ),
                    );
                  },
                  child: Text(
                    'Create Dollar Card',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
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
