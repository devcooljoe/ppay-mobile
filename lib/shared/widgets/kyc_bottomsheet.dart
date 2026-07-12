import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/auth/domain/entities/user_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class KycBottomsheet extends HookConsumerWidget {
  final UserEntity? user;

  const KycBottomsheet({super.key, this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bvnDone = (user?.isBvnVerified ?? false) || (user?.isBvnSubmitted ?? false);
    final kycDone = (user?.isKycVerified ?? false) || (user?.isKycSubmitted ?? false);

    // Auto-select the first item the user still needs to action.
    // BVN is done if submitted or verified → land on KYC (index 1).
    // If neither is done → land on BVN (index 0).
    final initialIndex = bvnDone ? 1 : 0;
    final selectedIndex = useState(initialIndex);

    final items = [
      _KycItem(
        leadingIcon: 'assets/icon/key_1.svg',
        title: 'Bank Verification Number',
        subtitle: 'Verify your BVN and face ID to confirm your identity',
        isVerified: user?.isBvnVerified ?? false,
        isSubmitted: user?.isBvnSubmitted ?? false,
      ),
      _KycItem(
        leadingIcon: 'assets/icon/userid.svg',
        title: 'KYC Verification',
        subtitle:
            'Confirm your personal information with your issued country ID',
        isVerified: user?.isKycVerified ?? false,
        isSubmitted: user?.isKycSubmitted ?? false,
      ),
    ];

    void handleContinue() {
      Navigator.pop(context);
      if (selectedIndex.value == 0) {
        context.router.push(const BvnVerificationRoute());
      } else {
        context.router.push(const KycVerificationRoute());
      }
    }

    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset(
                  'assets/icon/cancel.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 153.h,
                    width: 192.w,
                    child: Image.asset(
                      'assets/images/kycillustration.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Complete Identity Verification',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Please complete your verification to access all features',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => 12.verticalSpace,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final isSelected = selectedIndex.value == index;
                        final isDisabled = item.isVerified || item.isSubmitted;

                        return TouchOpacity(
                          onTap: isDisabled
                              ? null
                              : () => selectedIndex.value = index,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected && !isDisabled
                                  ? PPaymobileColors.buttonColor
                                      .withValues(alpha: 0.06)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isDisabled
                                    ? PPaymobileColors.lightGrey
                                    : isSelected
                                        ? PPaymobileColors.buttonColor
                                        : PPaymobileColors.textfiedBorder,
                                width: isSelected && !isDisabled ? 1.5.w : 1.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Opacity(
                                  opacity: isDisabled ? 0.4 : 1.0,
                                  child: SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: SvgPicture.asset(
                                      item.leadingIcon,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Opacity(
                                    opacity: isDisabled ? 0.4 : 1.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          item.isVerified
                                              ? 'Verified'
                                              : item.isSubmitted
                                                  ? 'Under review'
                                                  : item.subtitle,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 12.sp,
                                            color: item.isVerified
                                                ? PPaymobileColors.doneTextColor
                                                : item.isSubmitted
                                                    ? PPaymobileColors.warningTextColor
                                                    : const Color(0xff5B5B5B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    isDisabled
                                        ? 'assets/icon/check.svg'
                                        : isSelected
                                            ? 'assets/icon/check_circle.svg'
                                            : 'assets/icon/arrow_forward.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        height: 17.w,
                        width: 17.w,
                        child: SvgPicture.asset(
                          'assets/icon/filledlock.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Your data will be encrypted and stored securely',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: PPaymobileColors.svgIconColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
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
                      onPressed: handleContinue,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KycItem {
  final String leadingIcon;
  final String title;
  final String subtitle;
  final bool isVerified;
  final bool isSubmitted;

  const _KycItem({
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.isVerified,
    required this.isSubmitted,
  });
}
