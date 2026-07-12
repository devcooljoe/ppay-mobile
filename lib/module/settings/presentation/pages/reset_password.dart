import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

// This widget is kept as a non-route widget for backward compatibility
// It is used via MaterialPageRoute from veriify_password_detail_page (legacy path)
// The primary forgot-password reset flow now uses LoginPasswordResetRoute
class ResetPassword extends HookConsumerWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = useState(true);
    final obscureConfirm = useState(true);
    final password = useState('');
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();

    useEffect(() {
      void listener() => password.value = passwordController.text;
      passwordController.addListener(listener);
      return () => passwordController.removeListener(listener);
    }, []);

    final pw = password.value;
    final hasUpper = pw.contains(RegExp(r'[A-Z]'));
    final hasLower = pw.contains(RegExp(r'[a-z]'));
    final hasNumber = pw.contains(RegExp(r'[0-9]'));
    final hasSpecial = pw.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Verification'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    32.verticalSpace,
                    Text(
                      'Password Reset',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.buttonColorandText,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                            obscurePassword.value ? 'assets/icon/eye-slash.svg' : 'assets/icon/lock_eye.svg',
                          ),
                        ),
                      ),
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
                            obscureConfirm.value ? 'assets/icon/eye-slash.svg' : 'assets/icon/lock_eye.svg',
                          ),
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    _Rule(met: hasUpper, label: 'Include uppercase letters (A–Z)', entered: pw.isNotEmpty),
                    16.verticalSpace,
                    _Rule(met: hasLower, label: 'Include lowercase letters (a–z)', entered: pw.isNotEmpty),
                    16.verticalSpace,
                    _Rule(met: hasNumber, label: 'Include at least one number (0–9)', entered: pw.isNotEmpty),
                    16.verticalSpace,
                    _Rule(met: hasSpecial, label: 'Include at least one special character', entered: pw.isNotEmpty),
                  ],
                ),
              ),
              91.verticalSpace,
              PPButton(
                text: 'Reset Password',
                onPressed: () => context.router.push(PasswordChangedTwoRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Rule extends StatelessWidget {
  final bool met;
  final String label;
  final bool entered;
  const _Rule({required this.met, required this.label, required this.entered});

  @override
  Widget build(BuildContext context) {
    final icon = !entered
        ? 'assets/icon/tick_circle.svg'
        : met
            ? 'assets/icon/tick_pass.svg'
            : 'assets/icon/tick_fail.svg';
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(4.0).r, child: SvgPicture.asset(icon)),
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
