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
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();

    ref.listen(forgotPasswordProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          if (context.mounted) {
            context.router.push(VerifyForgotRoute(email: emailController.text.trim()));
          }
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Please enter your email below to retrieve your password',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email address';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                170.verticalSpace,
                PPButton(
                  text: 'Continue',
                  onPressed: () {
                    if (!(formKey.currentState?.validate() ?? false)) return;
                    ref.read(forgotPasswordProvider.notifier).call(
                      emailAddress: emailController.text.trim(),
                    );
                  },
                ),
                21.verticalSpace,
                TouchOpacity(
                  onTap: () => context.router.maybePop(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        height: 16.h,
                        width: 12.w,
                        'assets/icon/arrow_back.svg',
                      ),
                      8.horizontalSpace,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
