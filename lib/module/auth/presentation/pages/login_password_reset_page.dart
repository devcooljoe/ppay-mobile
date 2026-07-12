import 'package:auto_route/auto_route.dart';
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
class LoginPasswordResetPage extends HookConsumerWidget {
  final String resetToken;

  const LoginPasswordResetPage({super.key, required this.resetToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();
    final obscurePassword = useState(true);
    final obscureConfirm = useState(true);
    final password = useState('');

    final hasUppercase = useCallback(() => RegExp(r'[A-Z]').hasMatch(password.value), [password.value]);
    final hasLowercase = useCallback(() => RegExp(r'[a-z]').hasMatch(password.value), [password.value]);
    final hasNumber = useCallback(() => RegExp(r'[0-9]').hasMatch(password.value), [password.value]);
    final hasSpecial = useCallback(() => RegExp(r'[!@#\$&*~^%()_\-+=\[\]{};:,.<>?/\\|`]').hasMatch(password.value), [password.value]);

    ref.listen(resetPasswordProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          if (context.mounted) {
            context.router.push(const LoginPasswordChangedRoute());
          }
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                102.verticalSpace,
                Text(
                  'Password Reset',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Please enter new password below to set new password',
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
                  hintText: 'Enter new password',
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
                      return 'Please enter a new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must include an uppercase letter';
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'Password must include a lowercase letter';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must include a number';
                    }
                    if (!RegExp(r'[!@#\$&*~^%()_\-+=\[\]{};:,.<>?/\\|`]').hasMatch(value)) {
                      return 'Password must include a special character';
                    }
                    return null;
                  },
                  onChanged: (value) => password.value = value,
                ),
                29.verticalSpace,
                const PPLabel(text: 'Confirm Password'),
                6.verticalSpace,
                PPTextField(
                  controller: confirmController,
                  hintText: 'Confirm new password',
                  obscureText: obscureConfirm.value,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/lock.svg'),
                  ),
                  suffixIcon: TouchOpacity(
                    onTap: () => obscureConfirm.value = !obscureConfirm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0).r,
                      child: SvgPicture.asset(
                        obscureConfirm.value
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
                _PasswordRule(
                  met: hasUppercase(),
                  label: 'Include uppercase letters (A–Z)',
                  passwordEntered: password.value.isNotEmpty,
                ),
                16.verticalSpace,
                _PasswordRule(
                  met: hasLowercase(),
                  label: 'Include lowercase letters (a–z)',
                  passwordEntered: password.value.isNotEmpty,
                ),
                16.verticalSpace,
                _PasswordRule(
                  met: hasNumber(),
                  label: 'Include at least one number (0–9)',
                  passwordEntered: password.value.isNotEmpty,
                ),
                16.verticalSpace,
                _PasswordRule(
                  met: hasSpecial(),
                  label: 'Include at least one special character',
                  passwordEntered: password.value.isNotEmpty,
                ),
                91.verticalSpace,
                PPButton(
                  text: 'Reset Password',
                  onPressed: () {
                    if (!(formKey.currentState?.validate() ?? false)) return;
                    ref.read(resetPasswordProvider.notifier).call(
                      resetToken: resetToken,
                      password: passwordController.text,
                      confirmPassword: confirmController.text,
                    );
                  },
                ),
                21.verticalSpace,
                TouchOpacity(
                  onTap: () => context.router.popUntilRouteWithName(LoginRoute.name),
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
                        'Back to Login',
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
                21.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordRule extends StatelessWidget {
  final bool met;
  final String label;
  final bool passwordEntered;

  const _PasswordRule({
    required this.met,
    required this.label,
    required this.passwordEntered,
  });

  @override
  Widget build(BuildContext context) {
    final String iconAsset;
    if (!passwordEntered) {
      iconAsset = 'assets/icon/tick_circle.svg';
    } else if (met) {
      iconAsset = 'assets/icon/tick_pass.svg';
    } else {
      iconAsset = 'assets/icon/tick_fail.svg';
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0).r,
          child: SvgPicture.asset(iconAsset),
        ),
        8.horizontalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: PPaymobileColors.svgIconColor,
          ),
        ),
      ],
    );
  }
}
