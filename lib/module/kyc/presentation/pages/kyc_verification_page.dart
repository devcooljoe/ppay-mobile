import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/presentation/pages/smile_id_verification_page.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/document_bottom_sheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

void _logKyc(String message) {
  debugPrint('[KYC-Page] $message');
}

@RoutePage()
class KycVerificationPage extends HookConsumerWidget {
  const KycVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _logKyc('build() called');
    
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final selectedDoc = useState<KycDocumentTypeEntity?>(null);
    final idNumberController = useTextEditingController();
    final docFieldController = useTextEditingController();
    final isSubmitting = useState(false);

    Future<void> handleContinue() async {
      _logKyc('=== handleContinue() START ===');
      _logKyc('Form validation starting...');
      
      if (!(formKey.currentState?.validate() ?? false)) {
        _logKyc('Form validation FAILED, returning');
        return;
      }
      _logKyc('Form validation PASSED');
      
      if (isSubmitting.value) {
        _logKyc('Already submitting (double-tap guard), returning');
        return;
      }
      
      _logKyc('Setting isSubmitting=true');
      isSubmitting.value = true;
      
      _logKyc('Showing AppLoader');
      AppLoader.show(context);
      
      try {
        final idType = selectedDoc.value!.idType;
        final idNumber = idNumberController.text.trim();
        
        _logKyc('Creating verification job...');
        _logKyc('  jobType: biometric_kyc');
        _logKyc('  idType: $idType');
        _logKyc('  idNumber: $idNumber');
        
        // Create verification job
        final result = await ref.read(createVerificationJobProvider.notifier).call(
          jobType: 'biometric_kyc',
          idType: idType,
          idNumber: idNumber,
        );
        
        _logKyc('Verification job call returned');
        _logKyc('  result: $result');
        _logKyc('  context.mounted: ${context.mounted}');
        
        if (!context.mounted) {
          _logKyc('Context not mounted after job creation, returning');
          return;
        }
        
        if (result == null) {
          _logKyc('Result is NULL - job creation failed');
          AppLoader.hide(context);
          // Job creation failed (error was caught in provider)
          final errorState = ref.read(createVerificationJobProvider);
          _logKyc('  errorState.hasError: ${errorState.hasError}');
          if (errorState.hasError) {
            _logKyc('  error: ${errorState.error}');
            MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(errorState.error));
          } else {
            MessageHandler.showErrorSnackBar(context, 'Failed to create verification job');
          }
          isSubmitting.value = false;
          return;
        }
        
        _logKyc('Job created successfully, now fetching Smile ID token...');
        
        // Fetch the Smile ID token BEFORE navigating
        final token = await ref.read(smileIdTokenProvider.future);
        _logKyc('Token fetched successfully');
        _logKyc('  token preview: ${token.token.substring(0, 50)}...');
        _logKyc('  partnerId: ${token.partnerId}');
        
        if (!context.mounted) {
          _logKyc('Context not mounted after token fetch, returning');
          return;
        }
        
        _logKyc('Hiding AppLoader');
        AppLoader.hide(context);
        
        // CRITICAL: Wait for the post-frame callback in AppLoader.hide() to complete
        await Future.delayed(const Duration(milliseconds: 50));
        
        if (!context.mounted) {
          _logKyc('Context not mounted after loader hide delay, returning');
          return;
        }
        
        // Navigate to Smile ID verification with pre-fetched token
        final user = ref.read(authenticatedUserProvider).value;
        _logKyc('  user: $user');
        _logKyc('  user.fullName: ${user?.fullName}');
        _logKyc('  user.emailAddress: ${user?.emailAddress}');
        
        final routeParams = {
          'idType': idType,
          'idNumber': idNumber,
          'userFullName': user?.fullName ?? '',
          'userEmail': user?.emailAddress ?? '',
          'token': '${token.token.substring(0, 50)}...',
          'partnerId': token.partnerId,
          'callbackUrl': token.callbackUrl,
          'useSandbox': token.useSandbox.toString(),
          'smileJobId': result.smileJobId,
          'smileUserId': result.smileUserId,
        };
        _logKyc('Route params: $routeParams');
        
        _logKyc('>>> NAVIGATING to SmileIdVerificationPage via Navigator.push()');
        
        // Use Navigator.push directly instead of auto_route
        // ignore: unawaited_futures
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SmileIdVerificationPage(
              idType: idType,
              idNumber: idNumber,
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
        
        _logKyc('<<< Navigation push() called (not awaited)');
        _logKyc('<<< Returning from handleContinue WITHOUT resetting isSubmitting');
        
        return;
        
      } catch (e, stackTrace) {
        _logKyc('!!! EXCEPTION in handleContinue: $e');
        _logKyc('!!! Stack trace: $stackTrace');
        
        if (!context.mounted) {
          _logKyc('Context not mounted after exception, returning');
          return;
        }
        AppLoader.hide(context);
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(e));
        isSubmitting.value = false;
      }
    }

    // Derive the dynamic label for the ID number field
    final idLabel = selectedDoc.value != null
        ? 'Enter your ${selectedDoc.value!.name} number'
        : 'Enter ID number';

    final idHint = selectedDoc.value != null
        ? '${selectedDoc.value!.name} number'
        : 'Select a document first';

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'KYC Verification',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                21.verticalSpace,
                Text(
                  'Submit Document',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                7.verticalSpace,
                Text(
                  'Please submit any government-issued document to verify your identity',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                          'After entering your ID details, you will be asked to take a selfie for identity verification.',
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
                24.verticalSpace,
                const PPLabel(text: 'Document Type'),
                4.verticalSpace,
                FormField<KycDocumentTypeEntity>(
                  validator: (_) => selectedDoc.value == null
                      ? 'Please select a document type'
                      : null,
                  builder: (fieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TouchOpacity(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => DocumentBottomSheet(
                                selected: selectedDoc.value,
                                onSelected: (doc) {
                                  selectedDoc.value = doc;
                                  docFieldController.text = doc.name;
                                  idNumberController.clear();
                                  fieldState.didChange(doc);
                                },
                              ),
                            );
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: docFieldController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Select Document',
                                hintStyle: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.textfiedBorder,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(14.r),
                                  child: SvgPicture.asset(
                                    'assets/icon/arrow_down.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  borderSide: BorderSide(
                                    color: fieldState.hasError
                                        ? PPaymobileColors.redTextfield
                                        : PPaymobileColors.lightGrey,
                                    width: 1.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  borderSide: BorderSide(
                                    color: fieldState.hasError
                                        ? PPaymobileColors.redTextfield
                                        : PPaymobileColors.lightGrey,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (fieldState.hasError) ...[
                          4.verticalSpace,
                          Text(
                            fieldState.errorText!,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.redTextfield,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),
                28.verticalSpace,
                PPLabel(text: idLabel),
                4.verticalSpace,
                TextFormField(
                  controller: idNumberController,
                  enabled: selectedDoc.value != null,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your ${selectedDoc.value?.name ?? 'ID'} number';
                    }
                    if (value.trim().length < 5) {
                      return 'Please enter a valid ID number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: idHint,
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.redTextfield,
                        width: 1.w,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.redTextfield,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                if (selectedDoc.value != null) ...[
                  10.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/info.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                      9.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Enter your ${selectedDoc.value!.name} number exactly as it appears on the document',
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
                ],
                40.verticalSpace,
                PPButton(
                  text: 'Continue to Selfie Verification',
                  onPressed: handleContinue,
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
