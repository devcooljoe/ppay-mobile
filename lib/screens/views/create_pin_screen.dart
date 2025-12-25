import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/views/created_pin_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final TextEditingController _pinController = TextEditingController();

  void _onKeyTap(String value) {
    if (_pinController.text.length < 6) {
      setState(() {
        _pinController.text += value;
      });
    }
  }

  void _onDelete() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text = _pinController.text.substring(
          0,
          _pinController.text.length - 1,
        );
      });
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

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
          child: ListView(
            children: [
              24.verticalSpace,
              Text(
                'Security Pin',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'Enter unique security pin below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              46.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 76.h,
                    width: 76.w,
                    padding: EdgeInsets.all(13).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38).r,
                      color: PPaymobileColors.doneColor,
                    ),
                    child: SizedBox(
                      height: 42.h,
                      width: 42.w,
                      child: SvgPicture.asset(
                        'assets/icon/padlock.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  Pinput(
                    controller: _pinController,
                    length: 4,
                    keyboardType:
                        TextInputType.none, // 🚫 disable system keyboard
                    separatorBuilder: (index) => 18.horizontalSpace,
                    defaultPinTheme: PinTheme(
                      width: 52.w,
                      height: 49.h,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PPaymobileColors.textfiedBorder,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    'Please keep pin secure. Pin will be required before performing any transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                  29.verticalSpace,
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 24.w,
                    children: [
                      _key('1', onTap: () => _onKeyTap('1')),
                      _key('2', onTap: () => _onKeyTap('2')),
                      _key('3', onTap: () => _onKeyTap('3')),
                      _key('4', onTap: () => _onKeyTap('4')),
                      _key('5', onTap: () => _onKeyTap('5')),
                      _key('6', onTap: () => _onKeyTap('6')),
                      _key('7', onTap: () => _onKeyTap('7')),
                      _key('8', onTap: () => _onKeyTap('8')),
                      _key('9', onTap: () => _onKeyTap('9')),
                      const SizedBox(), // empty left
                      _key('0', onTap: () => _onKeyTap('0')),
                      _deleteKey(onTap: _onDelete),
                    ],
                  ),
                  24.verticalSpace,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CreatedPinScreen();
                            },
                          ),
                        );
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                          7.horizontalSpace,
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget _key(String text, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 64.h,
      width: 64.w,
      child: Text(
        text,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget _deleteKey({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 64.h,
      width: 64.w,
      child: Icon(Icons.backspace_outlined, size: 22.sp),
    ),
  );
}
