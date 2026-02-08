import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/bvn_face_recog_screen.dart';
import 'package:ppay_mobile/screens/widgets/bvn_reason_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_date_picker.dart';

class BvnVerificationScreen extends StatefulWidget {
  const BvnVerificationScreen({super.key});

  @override
  State<BvnVerificationScreen> createState() => _BvnVerificationScreenState();
}

class _BvnVerificationScreenState extends State<BvnVerificationScreen> {
  final TextEditingController _dateController = TextEditingController();

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
          'BVN Verification',
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
              44.verticalSpace,
              Text(
                'Confirm BVN',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              11.verticalSpace,
              Text(
                'Confirming your BVN helps us verify your identity and keep your account secured',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              Text(
                'Birth Date',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () async {
                    /// 👉 THIS is where the dialog is called
                    final selectedDate = await showDialog<DateTime>(
                      context: context,
                      builder: (_) => const CustomDatePickerDialog(),
                    );
                    if (selectedDate != null) {
                      _dateController.text =
                          "${selectedDate.day.toString().padLeft(2, '0')}/"
                          "${selectedDate.month.toString().padLeft(2, '0')}/"
                          "${selectedDate.year}";
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    hintText: '09/11/2009',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/calendar.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
              Text(
                'Bank Verification Number (11 digit)',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    hintText: 'Enter BVN',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/face_scan.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    // suffixIcon: Row(
                    //   children: [
                    //     SizedBox(
                    //       height: 24.h,
                    //       width: 24.w,
                    //       child: SvgPicture.asset(
                    //         'assets/icon/error.svg',
                    //         fit: BoxFit.scaleDown,
                    //       ),
                    //     ),
                    //     2.horizontalSpace,
                    //     SizedBox(
                    //       height: 24.h,
                    //       width: 24.w,
                    //       child: SvgPicture.asset(
                    //         'assets/icon/tick_pass.svg',
                    //         fit: BoxFit.scaleDown,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              4.verticalSpace,
              Text(
                'Incorrect BVN. Enter correct BVN',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.cryptoNumbersColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              160.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE0EBE5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42).r,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () async {},
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
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
                      borderRadius: BorderRadius.circular(42).r,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BvnFaceRecogScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const BvnReasonBottomsheet(),
                  );
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/info.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        'Why BVN is Needed?',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.doneTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: PPaymobileColors.doneTextColor,
                          decorationThickness: 2.h,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ],
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
