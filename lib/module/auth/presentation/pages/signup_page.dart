import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController(text: '+234');
    final agreedToTerms = useState(false);

    Future<void> handleNext() async {
      if (!agreedToTerms.value) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please agree to terms and conditions',
        );
        return;
      }

      if (!(formKey.currentState?.validate() ?? false)) {
        return;
      }

      final fullName = nameController.text.trim();
      final emailAddress = emailController.text.trim();
      final phoneNumber = phoneController.text.trim();

      if (fullName.split(' ').length < 2) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please enter your first and last name',
        );
        return;
      }

      if (!phoneNumber.startsWith('+234')) {
        MessageHandler.showErrorSnackBar(
          context,
          'Phone number must start with +234',
        );
        return;
      }

      final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
      if (digitsOnly.length != 13) {
        MessageHandler.showErrorSnackBar(
          context,
          'Phone number must be 11 digits after +234',
        );
        return;
      }

      context.router.push(
        CreatePasswordRoute(
          fullName: fullName,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
        ),
      );
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
                  if (value.trim().split(' ').length < 2) {
                    return 'Please enter your first and last name';
                  }
                  if (value.trim().length < 3) {
                    return 'Full name must be at least 3 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Full name can only contain letters';
                  }
                  return null;
                },
              ),
              29.verticalSpace,
              const PPLabel(text: 'Email Address'),
              6.verticalSpace,
              PPTextField(
                controller: emailController,
                hintText: 'e.g johndoe@gmail.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/message_icon.svg'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
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
                hintText: '+234 XXX XXX XXXX',
                keyboardType: TextInputType.phone,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: Image.asset('assets/images/flag_1.png', width: 20.w),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!value.startsWith('+234')) {
                    return 'Phone number must start with +234';
                  }
                  final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (digitsOnly.length != 13) {
                    return 'Phone number must be 11 digits after +234';
                  }
                  return null;
                },
              ),
              24.verticalSpace,
              TouchOpacity(
                onTap: () => agreedToTerms.value = !agreedToTerms.value,
                child: Row(
                  children: [
                    Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: agreedToTerms.value
                              ? const Color(0xff429E6E)
                              : Colors.grey,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                        color: agreedToTerms.value
                            ? const Color(0xff429E6E)
                            : Colors.transparent,
                      ),
                      child: agreedToTerms.value
                          ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                          : null,
                    ),
                    9.horizontalSpace,
                    Expanded(
                      child: Column(
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
                              decorationColor: const Color(0xff429E6E),
                              fontFamily: 'Montserrat',
                              color: const Color(0xff429E6E),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              101.verticalSpace,
              PPButton(text: 'Get Started', onPressed: handleNext),
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
