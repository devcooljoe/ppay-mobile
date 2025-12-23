import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/kyc_face_verification_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/document_bottom_sheet.dart';

class DriverLicenseScreen extends StatefulWidget {
  final String selectedDocument;
  const DriverLicenseScreen({super.key, required this.selectedDocument});

  @override
  State<DriverLicenseScreen> createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
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
          child: ListView(
            children: [
              21.verticalSpace,
              Text(
                'Submit Document',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              7.verticalSpace,
              Text(
                'Please submit any of your government issued document',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              64.verticalSpace,
              Text(
                'Document',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(
                    text: widget.selectedDocument,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true, // ✅ allows custom height
                          backgroundColor:
                              Colors.transparent, // for rounded corners
                          builder: (context) {
                            return DocumentBottomSheet();
                          },
                        );
                      },
                      child: SizedBox(
                        height: 13.h,
                        width: 7.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_down.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    hintText: 'Select Document',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
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
              32.verticalSpace,
              Text(
                'Enter Passport number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
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
              14.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0).r,
                    child: SvgPicture.asset(
                      'assets/icon/info.svg',
                      width: 14.w,
                      height: 14.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  9.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Enter your Driver’s License ID number as displayed on the front of your license card',
                      style: TextStyle(
                        decorationColor: PPaymobileColors.highlightTextColor,
                        fontFamily: 'Montserrat',
                        color: PPaymobileColors.buttonColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              178.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.textfiedBorder,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KycFaceVerificationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
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
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
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
