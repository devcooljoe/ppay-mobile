import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    Future<void> handleSignIn() async {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Form(
            key: formKey,
            child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  41.verticalSpace,
                  SizedBox(
                    height: 56.h,
                    width: 36.w,
                    child: Image.asset(
                      'assets/images/logo2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.buttonColorandText,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'Welcome back, enter the details below',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              60.verticalSpace,
              Text(
                'Enter Email or Phone No',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 56.h,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email or phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 15.h,
                    ),
                    hintText: 'Enter Details',
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
                'Enter Password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 56.h,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
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
                      child: SvgPicture.asset('assets/icon/lock.svg'),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(14.0).r,
                      child: SvgPicture.asset('assets/icon/lock_eye.svg'),
                    ),
                    hintText: 'Enter Password',
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
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0).r,
                        child: SvgPicture.asset(
                          'assets/icon/mark_icon.svg',
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                      3.horizontalSpace,
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  TouchOpacity(
                    onTap: () {
                      context.router.push(ForgotPasswordRoute());
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: PPaymobileColors.buttonColor,
                        fontFamily: 'Montserrat',
                        color: PPaymobileColors.buttonColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              71.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: isLoading.value ? null : handleSignIn,
                  child: isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              16.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Or Use Biometrics',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  22.verticalSpace,
                  SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: Image.asset(
                      'assets/images/fingerprint_2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              36.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                      context.router.push(SignupRoute());
                    },
                    child: Text(
                      'Sign Up',
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
      ),
    );
  }
}
