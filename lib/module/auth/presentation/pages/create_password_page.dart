import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CreatePasswordPage extends HookConsumerWidget {
  final String fullName;
  final String emailAddress;
  final String phoneNumber;

  const CreatePasswordPage({
    super.key,
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final obscurePassword = useState(true);
    final obscureConfirmPassword = useState(true);

    final hasUppercase = useState(false);
    final hasLowercase = useState(false);
    final hasNumber = useState(false);
    final hasSpecialChar = useState(false);
    final isMinLength = useState(false);

    useEffect(() {
      void listener() {
        final password = passwordController.text;
        hasUppercase.value = password.contains(RegExp(r'[A-Z]'));
        hasLowercase.value = password.contains(RegExp(r'[a-z]'));
        hasNumber.value = password.contains(RegExp(r'[0-9]'));
        hasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        isMinLength.value = password.length >= 8;
      }

      passwordController.addListener(listener);
      return () => passwordController.removeListener(listener);
    }, []);

    ref.listen(registerProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          context.router.push(const VerifyEmailOtpRoute());
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    Future<void> handleCreatePassword() async {
      if (formKey.currentState?.validate() ?? false) {
        final password = passwordController.text.trim();
        final confirmPassword = confirmPasswordController.text.trim();

        if (password != confirmPassword) {
          MessageHandler.showErrorSnackBar(context, 'Passwords do not match');
          return;
        }

        if (!hasUppercase.value || !hasLowercase.value || !hasNumber.value || !hasSpecialChar.value || !isMinLength.value) {
          MessageHandler.showErrorSnackBar(context, 'Password does not meet all requirements');
          return;
        }

        try {
          final deviceToken = await FirebaseMessaging.instance.getToken();
          ref.read(registerProvider.notifier).call(
            fullName: fullName,
            emailAddress: emailAddress,
            phoneNumber: phoneNumber,
            password: password,
            confirmPassword: confirmPassword,
            deviceToken: deviceToken,
          );
        } catch (_) {
          ref.read(registerProvider.notifier).call(
            fullName: fullName,
            emailAddress: emailAddress,
            phoneNumber: phoneNumber,
            password: password,
            confirmPassword: confirmPassword,
            deviceToken: null,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                40.verticalSpace,
                Text(
                  'Create Password',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Please enter password below to secure your account',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                60.verticalSpace,
                const PPLabel(text: 'Enter Password'),
                6.verticalSpace,
                PPTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: obscurePassword.value,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/lock.svg'),
                  ),
                  suffixIcon: TouchOpacity(
                    onTap: () => obscurePassword.value = !obscurePassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0).r,
                      child: SvgPicture.asset(
                        obscurePassword.value
                            ? 'assets/icon/eye-slash.svg'
                            : 'assets/icon/lock_eye.svg',
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                29.verticalSpace,
                const PPLabel(text: 'Confirm Password'),
                6.verticalSpace,
                PPTextField(
                  controller: confirmPasswordController,
                  hintText: 'Re-enter your password',
                  obscureText: obscureConfirmPassword.value,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/lock.svg'),
                  ),
                  suffixIcon: TouchOpacity(
                    onTap: () => obscureConfirmPassword.value = !obscureConfirmPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0).r,
                      child: SvgPicture.asset(
                        obscureConfirmPassword.value
                            ? 'assets/icon/eye-slash.svg'
                            : 'assets/icon/lock_eye.svg',
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0).r,
                      child: SvgPicture.asset(
                        hasUppercase.value ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
                      ),
                    ),
                    Text(
                      'Include uppercase letters (A–Z)',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0).r,
                      child: SvgPicture.asset(
                        hasLowercase.value ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
                      ),
                    ),
                    Text(
                      'Include lowercase letters (a–z)',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0).r,
                      child: SvgPicture.asset(
                        hasNumber.value ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
                      ),
                    ),
                    Text(
                      'Include at least one number (0–9)',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0).r,
                      child: SvgPicture.asset(
                        hasSpecialChar.value ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
                      ),
                    ),
                    Text(
                      'Include at least one special character',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0).r,
                      child: SvgPicture.asset(
                        isMinLength.value ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
                      ),
                    ),
                    Text(
                      'Minimum 8 characters',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
                60.verticalSpace,
                PPButton(
                  text: 'Create Password',
                  onPressed: handleCreatePassword,
                ),
                21.verticalSpace,
                TouchOpacity(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        height: 16.h,
                        width: 12.w,
                        'assets/icon/arrow_back.svg',
                      ),
                      5.horizontalSpace,
                      Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
