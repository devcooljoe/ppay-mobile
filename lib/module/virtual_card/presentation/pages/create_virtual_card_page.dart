import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CreateVirtualCardPage extends HookConsumerWidget {
  const CreateVirtualCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;
    final createState = ref.watch(createDollarCardProvider);

    final streetCtrl = useTextEditingController();
    final cityCtrl = useTextEditingController();
    final stateCtrl = useTextEditingController();
    final countryCtrl = useTextEditingController();
    final postalCtrl = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isBvnDone = user?.isBvnVerified ?? false;
    final isKycDone = user?.isKycVerified ?? false;
    final isEmailDone = user?.isEmailVerified ?? false;
    final allVerified = isBvnDone && isKycDone && isEmailDone;

    ref.listen(createDollarCardProvider, (_, next) {
      if (next is AsyncData) {
        context.router.replace(VirtualCardSuccessRoute());
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString()), backgroundColor: Colors.red),
        );
      }
    });

    Future<void> onSubmit() async {
      if (!allVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Complete all verifications before creating a card')),
        );
        return;
      }
      if (!formKey.currentState!.validate()) return;
      await ref.read(createDollarCardProvider.notifier).call(
        street: streetCtrl.text.trim(),
        city: cityCtrl.text.trim(),
        cardState: stateCtrl.text.trim(),
        country: countryCtrl.text.trim(),
        postalCode: postalCtrl.text.trim(),
      );
    }

    Widget verificationRow(String title, String subtitle, bool done, VoidCallback? onTap) {
      return GestureDetector(
        onTap: done ? null : onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
          color: PPaymobileColors.mainScreenBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    Text(subtitle, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 23.w,
                width: 23.w,
                child: SvgPicture.asset(
                  done ? 'assets/icon/tick_pass.svg' : 'assets/icon/arrow_forward.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      );
    }

    InputDecoration fieldDecoration(String label) => InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor),
      filled: true,
      fillColor: PPaymobileColors.deepBackgroundColor,
      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8).r),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    );

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Virtual Card', onBackPressed: () => Navigator.pop(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                45.verticalSpace,
                Text('Required Verification', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500)),
                9.verticalSpace,
                Text('Ensure you have completed all required verification to create dollar card', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                41.verticalSpace,
                verificationRow('Email & Phone Verification', 'Verify your email and phone number', isEmailDone, null),
                4.verticalSpace,
                verificationRow('Bank Verification Number', 'Verify BVN to conveniently make transaction', isBvnDone, () => context.router.push(BvnVerificationRoute())),
                4.verticalSpace,
                verificationRow('KYC Verification', 'Verify your government issued ID and face recognition', isKycDone, () => context.router.push(KycVerificationRoute())),
                32.verticalSpace,
                Text('Billing Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                8.verticalSpace,
                Text('Enter your address details for card creation', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                20.verticalSpace,
                TextFormField(
                  controller: streetCtrl,
                  decoration: fieldDecoration('Street Address'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityCtrl,
                        decoration: fieldDecoration('City'),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: stateCtrl,
                        decoration: fieldDecoration('State'),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: countryCtrl,
                        decoration: fieldDecoration('Country (e.g. NG)'),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: postalCtrl,
                        decoration: fieldDecoration('Postal Code'),
                        keyboardType: TextInputType.number,
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 8.w),
                  color: PPaymobileColors.warningColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.w, width: 16.w, child: SvgPicture.asset('assets/icon/warning.svg', fit: BoxFit.contain)),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          'A one-time card creation fee will be charged from your wallet.',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.warningTextColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                PPButton(
                  text: createState is AsyncLoading ? 'Creating...' : 'Create Dollar Card',
                  onPressed: createState is AsyncLoading ? null : onSubmit,
                  backgroundColor: PPaymobileColors.backgroundColor,
                ),
                17.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
