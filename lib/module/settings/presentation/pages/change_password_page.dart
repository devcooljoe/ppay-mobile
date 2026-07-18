import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final currentController = useTextEditingController();
    final newController = useTextEditingController();
    final confirmController = useTextEditingController();
    final obscureCurrent = useState(true);
    final obscureNew = useState(true);
    final obscureConfirm = useState(true);

    // Live password validation
    final newPassword = useState('');
    useEffect(() {
      void listener() => newPassword.value = newController.text;
      newController.addListener(listener);
      return () => newController.removeListener(listener);
    }, []);

    ref.listen(changePasswordProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else if (previous?.isLoading == true) {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else {
          MessageHandler.showSuccessSnackBar(context, 'Password changed successfully');
          context.router.push(const PasswordChangedRoute());
        }
      }
    });

    void handleSubmit() {
      if (!(formKey.currentState?.validate() ?? false)) return;
      ref.read(changePasswordProvider.notifier).call(
            currentPassword: currentController.text,
            newPassword: newController.text,
            confirmNewPassword: confirmController.text,
          );
    }

    final pw = newPassword.value;
    final hasUpper = pw.contains(RegExp(r'[A-Z]'));
    final hasLower = pw.contains(RegExp(r'[a-z]'));
    final hasNumber = pw.contains(RegExp(r'[0-9]'));
    final hasSpecial = pw.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Change Password'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      32.verticalSpace,
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.buttonColorandText,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        'Enter your current password and choose a new one',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      40.verticalSpace,
                      const PPLabel(text: 'Current Password'),
                      6.verticalSpace,
                      PPTextField(
                        controller: currentController,
                        hintText: 'Enter current password',
                        obscureText: obscureCurrent.value,
                        validator: (v) => (v == null || v.isEmpty) ? 'Please enter your current password' : null,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0).r,
                          child: SvgPicture.asset('assets/icon/lock.svg'),
                        ),
                        suffixIcon: TouchOpacity(
                          onTap: () => obscureCurrent.value = !obscureCurrent.value,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0).r,
                            child: SvgPicture.asset(
                              obscureCurrent.value ? 'assets/icon/eye-slash.svg' : 'assets/icon/lock_eye.svg',
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      const PPLabel(text: 'New Password'),
                      6.verticalSpace,
                      PPTextField(
                        controller: newController,
                        hintText: 'Enter new password',
                        obscureText: obscureNew.value,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Please enter a new password';
                          if (v.length < 8) return 'Password must be at least 8 characters';
                          return null;
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0).r,
                          child: SvgPicture.asset('assets/icon/lock.svg'),
                        ),
                        suffixIcon: TouchOpacity(
                          onTap: () => obscureNew.value = !obscureNew.value,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0).r,
                            child: SvgPicture.asset(
                              obscureNew.value ? 'assets/icon/eye-slash.svg' : 'assets/icon/lock_eye.svg',
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      const PPLabel(text: 'Confirm New Password'),
                      6.verticalSpace,
                      PPTextField(
                        controller: confirmController,
                        hintText: 'Confirm new password',
                        obscureText: obscureConfirm.value,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Please confirm your new password';
                          if (v != newController.text) return 'Passwords do not match';
                          return null;
                        },
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
                      16.verticalSpace,
                      _PasswordRule(met: hasUpper, label: 'Include uppercase letters (A–Z)'),
                      8.verticalSpace,
                      _PasswordRule(met: hasLower, label: 'Include lowercase letters (a–z)'),
                      8.verticalSpace,
                      _PasswordRule(met: hasNumber, label: 'Include at least one number (0–9)'),
                      8.verticalSpace,
                      _PasswordRule(met: hasSpecial, label: 'Include at least one special character'),
                    ],
                  ),
                ),
                24.verticalSpace,
                PPButton(text: 'Change Password', onPressed: handleSubmit),
                24.verticalSpace,
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
  const _PasswordRule({required this.met, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0).r,
          child: SvgPicture.asset(
            met ? 'assets/icon/tick_pass.svg' : 'assets/icon/tick_fail.svg',
          ),
        ),
        8.horizontalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: met ? PPaymobileColors.buttonColor : PPaymobileColors.svgIconColor,
          ),
        ),
      ],
    );
  }
}
