import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';

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
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
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
              const PPLabel(text: 'Full Name'),
              6.verticalSpace,
              PPTextField(
                controller: nameController,
                hintText: 'e.g John Doe',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/person_icon.svg'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              29.verticalSpace,
              const PPLabel(text: 'Email Address'),
              6.verticalSpace,
              PPTextField(
                controller: emailController,
                hintText: 'e.g johndoegmail.com',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/message_icon.svg'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              29.verticalSpace,
              const PPLabel(text: 'Phone Number'),
              6.verticalSpace,
              PPTextField(
                controller: phoneController,
                hintText: '+234',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(17.0).r,
                  child: Image.asset('assets/images/flag_1.png'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
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
              PPButton(
                text: 'Get Started',
                onPressed: handleSignUp,
                isLoading: isLoading.value,
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
