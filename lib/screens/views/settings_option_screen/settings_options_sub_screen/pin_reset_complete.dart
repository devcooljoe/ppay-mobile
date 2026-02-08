import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/settings_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class PinResetComplete extends StatefulWidget {
  const PinResetComplete({super.key});

  @override
  State<PinResetComplete> createState() => _PinResetCompleteState();
}

class _PinResetCompleteState extends State<PinResetComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              'assets/icon/arrow_back.svg',
              height: 16.h,
              width: 12.w,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140.h,
                          width: 140.w,
                          child: Image.asset(
                            'assets/images/password.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        60.verticalSpace,
                        Text(
                          'New Pin Created',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.verticalSpace,
                        Text(
                          textAlign: TextAlign.center,
                          'You have successfully created a new transaction pin. Please keep your pin safe',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        76.verticalSpace,
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PPaymobileColors.backgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(42),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Back to Settings',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                10.horizontalSpace,
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/arrow_forwardw.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
