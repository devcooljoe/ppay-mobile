import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isLoading = useState(false);

    Future<void> handleSignUp() async {
      if (formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 4));
        isLoading.value = false;
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Service not available'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: PPaymobileColors.mainScreenBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: Form(
          key: formKey,
          child: ListView(
          children: [
            40.verticalSpace,
            Row(
              children: [
                Text(
                  'Sign',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'UP',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
              ],
            ),
            8.verticalSpace,
            Text(
              'Welcome, Let’s Get You Started',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            45.verticalSpace,
            Text(
              'Full Name',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/person_icon.svg'),
                  ),
                  hintText: 'e.g John Doe',
                  hintStyle: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    color: PPaymobileColors.svgIconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            29.verticalSpace,
            Text(
              'Email Address',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/message_icon.svg'),
                  ),
                  hintText: 'e.g johndoegmail.com',
                  hintStyle: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    color: PPaymobileColors.svgIconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            29.verticalSpace,
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(17.0).r,
                    child: Image.asset('assets/images/flag_1.png'),
                  ),
                  hintText: '+234',
                  hintStyle: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0).r,
                  child: SvgPicture.asset(
                    'assets/icon/mark_icon.svg',
                    width: 18.w,
                    height: 18.h,
                  ),
                ),
                9.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By opening an account you agree to our ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'terms and conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff429E6E),
                        fontFamily: 'Montserrat',
                        color: Color(0xff429E6E),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            101.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: PPaymobileColors.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42.r),
                  ),
                ),
                onPressed: isLoading.value ? null : handleSignUp,
                child: isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                5.horizontalSpace,
                TouchOpacity(
                  onTap: () {
                    context.router.push(LoginRoute());
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: PPaymobileColors.buttonColor,
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
