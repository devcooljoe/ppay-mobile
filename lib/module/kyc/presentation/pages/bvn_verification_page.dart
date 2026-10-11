import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/kyc/presentation/pages/smile_id_verification_page.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/bvn_reason_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

void _logBvn(String message) {
  debugPrint('[BVN-Page] $message');
}

@RoutePage()
class BvnVerificationPage extends HookConsumerWidget {
  const BvnVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _logBvn('build() called');
    
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final dateController = useTextEditingController();
    final bvnController = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);
    final isSubmitting = useState(false);

    Future<void> handleProceed() async {
      _logBvn('=== handleProceed() START ===');
      _logBvn('Form validation starting...');
      
      if (!(formKey.currentState?.validate() ?? false)) {
        _logBvn('Form validation FAILED, returning');
        return;
      }
      _logBvn('Form validation PASSED');
      
      if (isSubmitting.value) {
        _logBvn('Already submitting (double-tap guard), returning');
        return;
      }
      
      _logBvn('Setting isSubmitting=true');
      isSubmitting.value = true;
      
      _logBvn('Showing AppLoader');
      AppLoader.show(context);
      
      try {
        _logBvn('Creating verification job...');
        _logBvn('  jobType: biometric_kyc');
        _logBvn('  idType: BVN');
        _logBvn('  idNumber: ${bvnController.text.trim()}');
        
        // Create verification job
        final result = await ref.read(createVerificationJobProvider.notifier).call(
          jobType: 'biometric_kyc',
          idType: 'BVN',
          idNumber: bvnController.text.trim(),
        );
        
        _logBvn('Verification job call returned');
        _logBvn('  result: $result');
        _logBvn('  context.mounted: ${context.mounted}');
        
        if (!context.mounted) {
          _logBvn('Context not mounted after job creation, returning');
          return;
        }
        
        if (result == null) {
          _logBvn('Result is NULL - job creation failed');
          AppLoader.hide(context);
          // Job creation failed (error was caught in provider)
          final errorState = ref.read(createVerificationJobProvider);
          _logBvn('  errorState.hasError: ${errorState.hasError}');
          if (errorState.hasError) {
            _logBvn('  error: ${errorState.error}');
            MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(errorState.error));
          } else {
            MessageHandler.showErrorSnackBar(context, 'Failed to create verification job');
          }
          return;
        }
        
        _logBvn('Job created successfully, now fetching Smile ID token...');
        
        // Fetch the Smile ID token BEFORE navigating
        // This prevents the SmileIdVerificationPage from being disposed during async fetch
        final token = await ref.read(smileIdTokenProvider.future);
        _logBvn('Token fetched successfully');
        _logBvn('  token preview: ${token.token.substring(0, 50)}...');
        _logBvn('  partnerId: ${token.partnerId}');
        
        if (!context.mounted) {
          _logBvn('Context not mounted after token fetch, returning');
          return;
        }
        
        _logBvn('Hiding AppLoader');
        AppLoader.hide(context);
        
        // CRITICAL: Wait for the post-frame callback in AppLoader.hide() to complete
        // before navigating. Otherwise the hide() pops our new route instead of the dialog!
        await Future.delayed(const Duration(milliseconds: 50));
        
        if (!context.mounted) {
          _logBvn('Context not mounted after loader hide delay, returning');
          return;
        }
        
        // Navigate to Smile ID verification with pre-fetched token
        final user = ref.read(authenticatedUserProvider).value;
        _logBvn('  user: $user');
        _logBvn('  user.fullName: ${user?.fullName}');
        _logBvn('  user.emailAddress: ${user?.emailAddress}');
        
        final routeParams = {
          'idType': 'BVN',
          'idNumber': bvnController.text.trim(),
          'userFullName': user?.fullName ?? '',
          'userEmail': user?.emailAddress ?? '',
          'token': token.token.substring(0, 50) + '...',
          'partnerId': token.partnerId,
          'callbackUrl': token.callbackUrl,
          'useSandbox': token.useSandbox.toString(),
          'smileJobId': result.smileJobId,
          'smileUserId': result.smileUserId,
        };
        _logBvn('Route params: $routeParams');
        
        _logBvn('>>> NAVIGATING to SmileIdVerificationPage via Navigator.push()');
        
        // Use Navigator.push directly instead of auto_route to avoid potential
        // issues with auto_route's route management causing widget disposal
        // ignore: unawaited_futures
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SmileIdVerificationPage(
              idType: 'BVN',
              idNumber: bvnController.text.trim(),
              userFullName: user?.fullName ?? '',
              userEmail: user?.emailAddress ?? '',
              token: token.token,
              partnerId: token.partnerId,
              callbackUrl: token.callbackUrl,
              useSandbox: token.useSandbox,
              smileJobId: result.smileJobId,
              smileUserId: result.smileUserId,
            ),
          ),
        );
        
        _logBvn('<<< Navigation push() called (not awaited)');
        _logBvn('<<< Returning from handleProceed WITHOUT resetting isSubmitting');
        
        // Return early - don't go to finally block which would trigger a rebuild
        return;
        
      } catch (e, stackTrace) {
        _logBvn('!!! EXCEPTION in handleProceed: $e');
        _logBvn('!!! Stack trace: $stackTrace');
        
        if (!context.mounted) {
          _logBvn('Context not mounted after exception, returning');
          return;
        }
        AppLoader.hide(context);
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(e));
        // Only reset isSubmitting on error, not on success
        isSubmitting.value = false;
      }
      // Removed finally block - isSubmitting is only reset on error
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'BVN Verification',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                44.verticalSpace,
                Text(
                  'Confirm BVN',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                11.verticalSpace,
                Text(
                  'Enter your BVN and complete a selfie verification to confirm your identity',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                40.verticalSpace,
                const PPLabel(text: 'Date of Birth'),
                4.verticalSpace,
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    final picked = await showModalBottomSheet<DateTime>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const CustomDatePickerDialog(),
                    );
                    if (picked != null) {
                      selectedDate.value = picked;
                      dateController.text =
                          '${picked.day.toString().padLeft(2, '0')}/'
                          '${picked.month.toString().padLeft(2, '0')}/'
                          '${picked.year}';
                    }
                  },
                  validator: (_) =>
                      selectedDate.value == null ? 'Please select your date of birth' : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    hintText: 'DD/MM/YYYY',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(14.r),
                      child: SvgPicture.asset(
                        'assets/icon/calendar.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                  ),
                ),
                24.verticalSpace,
                const PPLabel(text: 'Bank Verification Number (BVN)'),
                4.verticalSpace,
                TextFormField(
                  controller: bvnController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your BVN';
                    }
                    if (value.length != 11) {
                      return 'BVN must be exactly 11 digits';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    hintText: 'Enter your 11-digit BVN',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14.r),
                      child: SvgPicture.asset(
                        'assets/icon/face_scan.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/info.svg',
                      width: 14.w,
                      height: 14.h,
                    ),
                    9.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Your BVN is an 11-digit number on your bank card or accessible via *565*0#',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.buttonColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                // Info about selfie verification
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.warningColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.camera_front,
                        size: 20.sp,
                        color: PPaymobileColors.warningTextColor,
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Text(
                          'After entering your BVN, you will be asked to take a selfie for identity verification.',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.warningTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                40.verticalSpace,
                PPButton(
                  text: 'Continue to Selfie Verification',
                  onPressed: handleProceed,
                ),
                15.verticalSpace,
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const BvnReasonBottomsheet(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/info.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        'Why is BVN Needed?',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.doneTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: PPaymobileColors.doneTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
