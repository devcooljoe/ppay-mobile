import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/biometric_provider.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscurePassword = useState(true);
    final rememberMe = useState(false);
    final isBiometricEnabled = useState(false);
    final hasStoredSession = useState(false);

    useEffect(() {
      Future.microtask(() async {
        final tokenService = getIt<TokenService>();

        final savedEmail = await tokenService.getSavedEmail();
        final sessionExists = await tokenService.hasSavedSession();

        hasStoredSession.value = sessionExists;

        if (savedEmail != null && savedEmail.isNotEmpty) {
          emailController.text = savedEmail;
          rememberMe.value = true;
        }

        final enabled = await ref.read(biometricStateProvider.notifier).build();
        isBiometricEnabled.value = enabled;

        // Auto-trigger biometric prompt if session exists and biometric is on
        if (sessionExists && enabled && context.mounted) {
          await _handleBiometricLogin(context, ref);
        }
      });
      return null;
    }, []);

    ref.listen(loginProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        if (next.hasError) {
          AppLoader.hide(context);
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
        next.whenData((_) async {
          await ref.read(authenticatedUserProvider.notifier).call();
          if (!context.mounted) return;
          AppLoader.hide(context);
          _navigateAfterAuth(context, ref);
        });
      }
    });

    Future<void> handleSignIn() async {
      if (!(formKey.currentState?.validate() ?? false)) return;

      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      try {
        final deviceToken = await FirebaseMessaging.instance.getToken();
        ref
            .read(loginProvider.notifier)
            .call(
              emailAddress: email,
              password: password,
              deviceToken: deviceToken,
            );
      } catch (_) {
        ref
            .read(loginProvider.notifier)
            .call(emailAddress: email, password: password, deviceToken: null);
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
                const PPLabel(text: 'Email Address'),
                4.verticalSpace,
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
                const PPLabel(text: 'Password'),
                4.verticalSpace,
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
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                        child: SvgPicture.asset(
                          obscurePassword.value
                              ? 'assets/icon/eye-slash.svg'
                              : 'assets/icon/eye.svg',
                        ),
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
                6.verticalSpace,
                // Only show "Remember Me" when there is no stored session yet.
                // Once the user is remembered, this checkbox is hidden permanently
                // until they explicitly log out from inside the app.
                if (!hasStoredSession.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TouchOpacity(
                        onTap: () => rememberMe.value = !rememberMe.value,
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: rememberMe.value
                                      ? const Color(0xff429E6E)
                                      : Colors.grey,
                                  width: 2.w,
                                ),
                                borderRadius: BorderRadius.circular(4.r),
                                color: rememberMe.value
                                    ? const Color(0xff429E6E)
                                    : Colors.transparent,
                              ),
                              child: rememberMe.value
                                  ? Icon(
                                      Icons.check,
                                      size: 14.sp,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            9.horizontalSpace,
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
                      ),
                      TouchOpacity(
                        onTap: () => context.router.push(ForgotPasswordRoute()),
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
                // When session exists, show only Forgot Password aligned right
                if (hasStoredSession.value)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TouchOpacity(
                      onTap: () => context.router.push(ForgotPasswordRoute()),
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
                  ),
                71.verticalSpace,
                PPButton(text: 'Sign In', onPressed: handleSignIn),
                16.verticalSpace,
                if (isBiometricEnabled.value)
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
                      TouchOpacity(
                        onTap: () => _handleBiometricLogin(context, ref),
                        child: SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: Image.asset(
                            'assets/images/fingerprint_2.png',
                            fit: BoxFit.contain,
                          ),
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
                      onTap: () => context.router.push(SignupRoute()),
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

  Future<void> _handleBiometricLogin(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final authenticated = await ref
        .read(biometricStateProvider.notifier)
        .authenticate('Authenticate to sign in');

    if (!authenticated || !context.mounted) return;

    AppLoader.show(context);
    await ref.read(authenticatedUserProvider.notifier).call();
    if (!context.mounted) return;
    AppLoader.hide(context);
    _navigateAfterAuth(context, ref);
  }

  void _navigateAfterAuth(BuildContext context, WidgetRef ref) {
    final user = ref.read(authenticatedUserProvider).value;
    if (user == null) return;

    if (!user.isEmailVerified) {
      context.router.replaceAll([const VerifyCodeRoute()]);
    } else if (!user.isPhoneNumberVerified) {
      context.router.replaceAll([const VerifyPhoneRoute()]);
    } else {
      context.router.replaceAll([const ExploreRoute()]);
    }
  }
}
