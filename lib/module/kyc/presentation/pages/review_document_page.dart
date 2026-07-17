import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class ReviewDocumentPage extends HookConsumerWidget {
  const ReviewDocumentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;

    final isBvnVerified = user?.isBvnVerified ?? false;
    final isBvnSubmitted = user?.isBvnSubmitted ?? false;
    final isKycVerified = user?.isKycVerified ?? false;
    final isKycSubmitted = user?.isKycSubmitted ?? false;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'KYC Verification'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          children: [
            Text(
              'Identity Verification',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.verticalSpace,
            Text(
              'Complete the steps below to verify your identity and unlock higher account limits.',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            32.verticalSpace,
            _VerificationStep(
              stepNumber: '1',
              title: 'BVN Verification',
              description: 'Link your Bank Verification Number to confirm your identity.',
              isCompleted: isBvnVerified,
              isPending: isBvnSubmitted && !isBvnVerified,
              isLocked: false,
              onTap: isBvnVerified
                  ? null
                  : () => context.router.push(BvnVerificationRoute()),
            ),
            16.verticalSpace,
            _VerificationStep(
              stepNumber: '2',
              title: 'Document Verification',
              description: 'Submit a government-issued ID to complete your KYC.',
              isCompleted: isKycVerified,
              isPending: isKycSubmitted && !isKycVerified,
              isLocked: !isBvnVerified,
              onTap: (isKycVerified || !isBvnVerified)
                  ? null
                  : () => context.router.push(KycVerificationRoute()),
            ),
            40.verticalSpace,
            if (isKycVerified) ...[
              _StatusBanner(
                icon: 'assets/icon/check.svg',
                message: 'Your identity has been fully verified.',
                color: PPaymobileColors.doneColor,
                textColor: PPaymobileColors.doneTextColor,
              ),
            ] else if (isKycSubmitted && !isKycVerified) ...[
              _StatusBanner(
                icon: 'assets/icon/warning.svg',
                message: 'Your documents are under review. This usually takes 1–2 business days.',
                color: PPaymobileColors.warningColor,
                textColor: PPaymobileColors.warningTextColor,
              ),
            ] else if (!isBvnVerified) ...[
              _StatusBanner(
                icon: 'assets/icon/warning.svg',
                message: 'Start with BVN verification to unlock document submission.',
                color: PPaymobileColors.warningColor,
                textColor: PPaymobileColors.warningTextColor,
              ),
            ],
            if (!isBvnVerified) ...[
              32.verticalSpace,
              PPButton(
                text: 'Start BVN Verification',
                onPressed: () => context.router.push(BvnVerificationRoute()),
              ),
            ] else if (!isKycVerified && !isKycSubmitted) ...[
              32.verticalSpace,
              PPButton(
                text: 'Submit Document',
                onPressed: () => context.router.push(KycVerificationRoute()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _VerificationStep extends StatelessWidget {
  final String stepNumber;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isPending;
  final bool isLocked;
  final VoidCallback? onTap;

  const _VerificationStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isPending,
    required this.isLocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isCompleted
        ? PPaymobileColors.buttonColor
        : isPending
            ? PPaymobileColors.itemsColor
            : isLocked
                ? PPaymobileColors.textfiedBorder
                : PPaymobileColors.textfiedBorder;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
          color: isLocked ? PPaymobileColors.deepBackgroundColor : PPaymobileColors.mainScreenBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StepIndicator(
              stepNumber: stepNumber,
              isCompleted: isCompleted,
              isPending: isPending,
              isLocked: isLocked,
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: isLocked ? PPaymobileColors.svgIconColor : Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _StatusChip(isCompleted: isCompleted, isPending: isPending, isLocked: isLocked),
                    ],
                  ),
                  6.verticalSpace,
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (!isCompleted && !isPending && !isLocked) ...[
                    12.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Tap to start',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.horizontalSpace,
                        SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          width: 14.w,
                          height: 14.w,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final String stepNumber;
  final bool isCompleted;
  final bool isPending;
  final bool isLocked;

  const _StepIndicator({
    required this.stepNumber,
    required this.isCompleted,
    required this.isPending,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: PPaymobileColors.doneColor,
        ),
        child: Center(
          child: SvgPicture.asset('assets/icon/check.svg', width: 16.w, height: 16.w),
        ),
      );
    }
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLocked
            ? PPaymobileColors.deepBackgroundColor
            : PPaymobileColors.anotherButtonColor,
        border: Border.all(
          color: isLocked ? PPaymobileColors.textfiedBorder : PPaymobileColors.buttonColor,
          width: 1.w,
        ),
      ),
      child: Center(
        child: Text(
          stepNumber,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isLocked ? PPaymobileColors.svgIconColor : PPaymobileColors.buttonColor,
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isCompleted;
  final bool isPending;
  final bool isLocked;

  const _StatusChip({
    required this.isCompleted,
    required this.isPending,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return _Chip(label: 'Verified', bg: PPaymobileColors.doneColor, textColor: PPaymobileColors.doneTextColor);
    }
    if (isPending) {
      return _Chip(label: 'Pending', bg: PPaymobileColors.warningColor, textColor: PPaymobileColors.warningTextColor);
    }
    if (isLocked) {
      return _Chip(label: 'Locked', bg: PPaymobileColors.deepBackgroundColor, textColor: PPaymobileColors.svgIconColor);
    }
    return _Chip(label: 'Not started', bg: PPaymobileColors.deepBackgroundColor, textColor: PPaymobileColors.svgIconColor);
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color bg;
  final Color textColor;

  const _Chip({required this.label, required this.bg, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  final String icon;
  final String message;
  final Color color;
  final Color textColor;

  const _StatusBanner({
    required this.icon,
    required this.message,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, width: 18.w, height: 18.w, fit: BoxFit.contain),
          10.horizontalSpace,
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: textColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
