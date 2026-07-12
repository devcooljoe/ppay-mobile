import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/document_bottom_sheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';

@RoutePage()
class KycVerificationPage extends HookConsumerWidget {
  const KycVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final selectedDoc = useState<KycDocumentTypeEntity?>(null);
    final idNumberController = useTextEditingController();
    final docFieldController = useTextEditingController();

    ref.listen(verifyKycProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          context.router.replace(const KycVerificationCompleteRoute());
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    void handleContinue() {
      if (!(formKey.currentState?.validate() ?? false)) return;

      ref.read(verifyKycProvider.notifier).call(
            idType: selectedDoc.value!.idType,
            idNumber: idNumberController.text.trim(),
          );
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
                40.verticalSpace,
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
                        GestureDetector(
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
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                          color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                          color: PPaymobileColors.redTextfield, width: 1.w),
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
                            fontFamily: 'Montserrat',
                            color: PPaymobileColors.buttonColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                60.verticalSpace,
                PPButton(
                  text: 'Continue',
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
