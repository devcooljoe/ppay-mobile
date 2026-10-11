import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/auth/domain/entities/user_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class KycBottomsheet extends ConsumerWidget {
  final UserEntity? user;

  const KycBottomsheet({super.key, this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bvnDone =
        (user?.isBvnVerified ?? false) || (user?.isBvnSubmitted ?? false);
    final kycDone =
        (user?.isKycVerified ?? false) || (user?.isKycSubmitted ?? false);

    // BVN is always the active step until it's done, then KYC becomes active.
    // The user cannot manually switch: the active step is determined by state.
    final activeIndex = bvnDone ? 1 : 0;

    // Check if all verifications are complete
    final allComplete = bvnDone && kycDone;

    final items = [
      _KycItem(
        stepNumber: 1,
        leadingIcon: 'assets/icon/key_1.svg',
        title: 'BVN Verification',
        subtitle: 'Verify your identity with your Bank Verification Number',
        isVerified: user?.isBvnVerified ?? false,
        isSubmitted: user?.isBvnSubmitted ?? false,
      ),
      _KycItem(
        stepNumber: 2,
        leadingIcon: 'assets/icon/userid.svg',
        title: 'Document Verification',
        subtitle: 'Upload a valid government-issued ID (NIN, Passport, etc.)',
        isVerified: user?.isKycVerified ?? false,
        isSubmitted: user?.isKycSubmitted ?? false,
      ),
    ];

    void handleContinue() {
      Navigator.pop(context);
      if (activeIndex == 0) {
        context.router.push(const BvnVerificationRoute());
      } else {
        context.router.push(const KycVerificationRoute());
      }
    }

    return FractionallySizedBox(
      heightFactor: 0.78,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Close button
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Icon(
                Icons.close_rounded,
                size: 24.w,
                color: PPaymobileColors.svgIconColor,
              ),
            ),
          ),
          12.verticalSpace,
          // Main content
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  32.verticalSpace,
                  // Header illustration
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.buttonColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon/userid.svg',
                        height: 48.h,
                        width: 48.w,
                        colorFilter: ColorFilter.mode(
                          PPaymobileColors.buttonColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  // Title
                  Text(
                    'Identity Verification',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  8.verticalSpace,
                  // Subtitle
                  Text(
                    'Complete these steps to unlock all features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  24.verticalSpace,
                  // Progress indicator
                  _buildProgressIndicator(bvnDone, kycDone),
                  20.verticalSpace,
                  // Verification steps
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      separatorBuilder: (_, __) => 12.verticalSpace,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final isActive = activeIndex == index;
                        final isDone = item.isVerified || item.isSubmitted;
                        // KYC is locked (not tappable) until BVN is done
                        final isLocked = index == 1 && !bvnDone;

                        return _buildVerificationStep(
                          item: item,
                          isActive: isActive,
                          isDone: isDone,
                          isLocked: isLocked,
                        );
                      },
                    ),
                  ),
                  // Security note
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 32.w,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icon/filledlock.svg',
                              height: 16.h,
                              width: 16.w,
                              colorFilter: ColorFilter.mode(
                                PPaymobileColors.buttonColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bank-level security',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              2.verticalSpace,
                              Text(
                                'Your data is encrypted and stored securely',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PPaymobileColors.svgIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: allComplete
                            ? PPaymobileColors.doneTextColor
                            : PPaymobileColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed: allComplete ? () => Navigator.pop(context) : handleContinue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            allComplete
                                ? 'Verification Complete'
                                : activeIndex == 0
                                    ? 'Start BVN Verification'
                                    : 'Continue to Document Verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                          if (!allComplete) ...[
                            8.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 18.w,
                              color: Colors.white,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(bool bvnDone, bool kycDone) {
    final completedSteps = (bvnDone ? 1 : 0) + (kycDone ? 1 : 0);
    final progress = completedSteps / 2;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: PPaymobileColors.svgIconColor,
              ),
            ),
            Text(
              '$completedSteps of 2 completed',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: completedSteps == 2
                    ? PPaymobileColors.doneTextColor
                    : PPaymobileColors.buttonColor,
              ),
            ),
          ],
        ),
        8.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6.h,
            backgroundColor: const Color(0xFFE8E8E8),
            valueColor: AlwaysStoppedAnimation<Color>(
              completedSteps == 2
                  ? PPaymobileColors.doneTextColor
                  : PPaymobileColors.buttonColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationStep({
    required _KycItem item,
    required bool isActive,
    required bool isDone,
    required bool isLocked,
  }) {
    // Determine status color and icon
    Color borderColor;
    Color backgroundColor;
    Widget statusIcon;

    if (item.isVerified) {
      borderColor = PPaymobileColors.doneTextColor;
      backgroundColor = PPaymobileColors.doneTextColor.withValues(alpha: 0.05);
      statusIcon = Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          color: PPaymobileColors.doneTextColor,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(
          Icons.check_rounded,
          size: 18.w,
          color: Colors.white,
        ),
      );
    } else if (item.isSubmitted) {
      borderColor = PPaymobileColors.warningTextColor;
      backgroundColor = PPaymobileColors.warningTextColor.withValues(alpha: 0.05);
      statusIcon = Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          color: PPaymobileColors.warningTextColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(
          Icons.schedule_rounded,
          size: 16.w,
          color: PPaymobileColors.warningTextColor,
        ),
      );
    } else if (isActive) {
      borderColor = PPaymobileColors.buttonColor;
      backgroundColor = PPaymobileColors.buttonColor.withValues(alpha: 0.05);
      statusIcon = Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: PPaymobileColors.buttonColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            '${item.stepNumber}',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: PPaymobileColors.buttonColor,
            ),
          ),
        ),
      );
    } else {
      borderColor = const Color(0xFFE0E0E0);
      backgroundColor = Colors.transparent;
      statusIcon = Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: isLocked
              ? Icon(
                  Icons.lock_rounded,
                  size: 14.w,
                  color: const Color(0xFFBDBDBD),
                )
              : Text(
                  '${item.stepNumber}',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFBDBDBD),
                  ),
                ),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: isActive && !isDone ? 1.5.w : 1.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          statusIcon,
          14.horizontalSpace,
          Expanded(
            child: Opacity(
              opacity: isLocked ? 0.5 : 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      if (isActive && !isDone) ...[
                        8.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColor,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  4.verticalSpace,
                  Text(
                    item.isVerified
                        ? 'Verified successfully'
                        : item.isSubmitted
                            ? 'Under review - we\'ll notify you soon'
                            : item.subtitle,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: item.isVerified
                          ? PPaymobileColors.doneTextColor
                          : item.isSubmitted
                              ? PPaymobileColors.warningTextColor
                              : const Color(0xFF757575),
                    ),
                  ),
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
  final int stepNumber;
  final String leadingIcon;
  final String title;
  final String subtitle;
  final bool isVerified;
  final bool isSubmitted;

  const _KycItem({
    required this.stepNumber,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.isVerified,
    required this.isSubmitted,
  });
}
