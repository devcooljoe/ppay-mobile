import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/purchase_dollarcard_bottomsheet.dart';

class CreateVirtualCard extends StatefulWidget {
  const CreateVirtualCard({super.key});

  @override
  State<CreateVirtualCard> createState() => _CreateVirtualCardState();
}

class _CreateVirtualCardState extends State<CreateVirtualCard> {
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
              45.verticalSpace,
              Text(
                'Required Verification',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              9.verticalSpace,
              Text(
                'Ensure you have completed all required verification to create dollar card',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              41.verticalSpace,
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email & Phone Verification',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Verify your email and phone number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                      width: 23.w,
                      child: SvgPicture.asset(
                        'assets/icon/tick_pass.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank Verification Number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Verify BVN to conveniently make transaction',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                      width: 23.w,
                      child: SvgPicture.asset(
                        'assets/icon/tick_pass.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Container(
                height: 92.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'KYC Verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Verify your government issued ID and face recognition',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 26.0.w),
                      child: SizedBox(
                        height: 23.h,
                        width: 12.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              75.verticalSpace,
              Container(
                height: 66,
                width: double.infinity,
                color: PPaymobileColors.warningColor,
                padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: SvgPicture.asset(
                        'assets/icon/warning.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Note: You will be fined  \$1,23 dollars to create new dollar card. To proceed click the button below",
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.warningTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.doneColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24).r,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Pay \$XXX to activate card',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24).r,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () async {
                    final bank = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const PurchaseDollarcardBottomsheet(),
                    );
                  },
                  child: Text(
                    'Pay \$XXX to activate card',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              17.verticalSpace,
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Review ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms and condition',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.buyTradeContainerColor,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            PPaymobileColors.buyTradeContainerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
