import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/gender_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

// Holds collected passenger data for the booking flow
final passengerFormDataProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

@RoutePage()
class PassengerDetailsPage extends HookConsumerWidget {
  const PassengerDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirmation = ref.watch(selectedConfirmationProvider);
    final searchState = ref.watch(flightSearchStateProvider);

    final totalPassengers = searchState.adults + searchState.children + searchState.infants;
    final currentIndex = useState(0);

    // Form controllers for current passenger
    final firstNameCtrl = useTextEditingController();
    final lastNameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final phoneCtrl = useTextEditingController();
    final passportCtrl = useTextEditingController();
    final passportExpiryCtrl = useTextEditingController();
    final passportIssuingDateCtrl = useTextEditingController();
    final issuingCountryCtrl = useTextEditingController();
    final nationalityCtrl = useTextEditingController();
    final dobCtrl = useTextEditingController();
    final genderValue = useState('');
    final titleValue = useState('mr');

    void _clearForm() {
      firstNameCtrl.clear();
      lastNameCtrl.clear();
      emailCtrl.clear();
      phoneCtrl.clear();
      passportCtrl.clear();
      passportExpiryCtrl.clear();
      passportIssuingDateCtrl.clear();
      issuingCountryCtrl.clear();
      nationalityCtrl.clear();
      dobCtrl.clear();
      genderValue.value = '';
      titleValue.value = 'mr';
    }

    String _passengerType(int index) {
      if (index < searchState.adults) return 'adult';
      if (index < searchState.adults + searchState.children) return 'child';
      return 'infant';
    }

    bool _isDocumentRequired() => confirmation?.documentRequired ?? false;

    void _saveAndProceed() {
      if (firstNameCtrl.text.trim().isEmpty || lastNameCtrl.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter passenger name');
        return;
      }
      if (emailCtrl.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter email');
        return;
      }
      if (phoneCtrl.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter phone number');
        return;
      }
      if (dobCtrl.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please select date of birth');
        return;
      }
      if (genderValue.value.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please select gender');
        return;
      }
      if (_isDocumentRequired()) {
        if (passportCtrl.text.trim().isEmpty) {
          MessageHandler.showErrorSnackBar(context, 'Please enter passport number');
          return;
        }
        if (passportExpiryCtrl.text.trim().isEmpty) {
          MessageHandler.showErrorSnackBar(context, 'Please enter passport expiry date');
          return;
        }
      }

      final passenger = <String, dynamic>{
        'passengerType': _passengerType(currentIndex.value),
        'firstName': firstNameCtrl.text.trim(),
        'lastName': lastNameCtrl.text.trim(),
        'title': titleValue.value,
        'dob': dobCtrl.text.trim(),
        'gender': genderValue.value,
        'email': emailCtrl.text.trim(),
        'phoneNumber': phoneCtrl.text.trim(),
        if (_isDocumentRequired() && passportCtrl.text.isNotEmpty)
          'documents': {
            'number': passportCtrl.text.trim(),
            'issuingDate': passportIssuingDateCtrl.text.trim().isNotEmpty ? passportIssuingDateCtrl.text.trim() : '2020-01-01',
            'expiryDate': passportExpiryCtrl.text.trim(),
            'issuingCountry': issuingCountryCtrl.text.trim().isNotEmpty ? issuingCountryCtrl.text.trim() : 'NG',
            'nationalityCountry': nationalityCtrl.text.trim().isNotEmpty ? nationalityCtrl.text.trim() : 'NG',
            'documentType': 'passport',
          },
      };

      final existing = List<Map<String, dynamic>>.from(ref.read(passengerFormDataProvider));
      if (currentIndex.value < existing.length) {
        existing[currentIndex.value] = passenger;
      } else {
        existing.add(passenger);
      }
      ref.read(passengerFormDataProvider.notifier).state = existing;

      if (currentIndex.value < totalPassengers - 1) {
        currentIndex.value++;
        _clearForm();
      } else {
        context.router.push(const SelectSeatRoute());
      }
    }

    Future<void> _pickDob() async {
      final result = await showModalBottomSheet<DateTime>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const CustomDatePickerDialog(),
      );
      if (result != null) {
        dobCtrl.text = DateFormat('yyyy-MM-dd').format(result);
      }
    }

    Future<void> _pickGender() async {
      final result = await showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const GenderBottomsheet(),
      );
      if (result != null) genderValue.value = result;
    }

    final passengerLabel = 'Passenger ${currentIndex.value + 1} of $totalPassengers (${_passengerType(currentIndex.value)})';

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Passenger Details'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: ListView(
            children: [
              20.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: PPaymobileColors.anotheroptionbgColor),
                child: Text(passengerLabel, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
              ),
              20.verticalSpace,
              PPLabel(text: 'Title'),
              4.verticalSpace,
              _DropdownField(
                value: titleValue.value,
                options: const ['mr', 'mrs', 'ms', 'dr'],
                labels: const ['Mr', 'Mrs', 'Ms', 'Dr'],
                onChanged: (v) => titleValue.value = v,
              ),
              20.verticalSpace,
              PPLabel(text: 'First Name'),
              4.verticalSpace,
              PPTextField(hintText: 'Enter first name', controller: firstNameCtrl),
              20.verticalSpace,
              PPLabel(text: 'Last Name'),
              4.verticalSpace,
              PPTextField(hintText: 'Enter last name', controller: lastNameCtrl),
              20.verticalSpace,
              PPLabel(text: 'Email'),
              4.verticalSpace,
              PPTextField(hintText: 'Enter email', controller: emailCtrl, keyboardType: TextInputType.emailAddress),
              20.verticalSpace,
              PPLabel(text: 'Phone Number'),
              4.verticalSpace,
              PPTextField(hintText: '+234...', controller: phoneCtrl, keyboardType: TextInputType.phone),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PPLabel(text: 'Date of Birth'),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: _pickDob,
                        child: Container(
                          height: 54.h,
                          width: 189.5.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r), border: Border.all(color: PPaymobileColors.lightGrey, width: 1.w)),
                          child: Row(children: [
                            SvgPicture.asset('assets/icon/calendar.svg', height: 18.w, width: 18.w),
                            SizedBox(width: 8.w),
                            Text(dobCtrl.text.isEmpty ? 'Select' : dobCtrl.text, style: TextStyle(fontFamily: 'InstrumentSans', color: dobCtrl.text.isEmpty ? PPaymobileColors.lightGrey : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PPLabel(text: 'Gender'),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: _pickGender,
                        child: Container(
                          height: 54.h,
                          width: 189.5.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r), border: Border.all(color: PPaymobileColors.lightGrey, width: 1.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(genderValue.value.isEmpty ? 'Select' : genderValue.value, style: TextStyle(fontFamily: 'InstrumentSans', color: genderValue.value.isEmpty ? PPaymobileColors.lightGrey : Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                              SvgPicture.asset('assets/icon/arrow_down.svg', height: 13.h, width: 7.w, fit: BoxFit.scaleDown),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (_isDocumentRequired()) ...[
                20.verticalSpace,
                PPLabel(text: 'Passport Number'),
                4.verticalSpace,
                PPTextField(hintText: 'e.g. A12345678', controller: passportCtrl),
                20.verticalSpace,
                PPLabel(text: 'Passport Expiry Date'),
                4.verticalSpace,
                PPTextField(hintText: 'YYYY-MM-DD', controller: passportExpiryCtrl),
                20.verticalSpace,
                PPLabel(text: 'Issuing Country (2-letter code)'),
                4.verticalSpace,
                PPTextField(hintText: 'e.g. NG', controller: issuingCountryCtrl),
                20.verticalSpace,
                PPLabel(text: 'Nationality (2-letter code)'),
                4.verticalSpace,
                PPTextField(hintText: 'e.g. NG', controller: nationalityCtrl),
              ],
              40.verticalSpace,
              PPButton(
                text: currentIndex.value < totalPassengers - 1 ? 'Next Passenger' : 'Continue',
                onPressed: _saveAndProceed,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String value;
  final List<String> options;
  final List<String> labels;
  final ValueChanged<String> onChanged;

  const _DropdownField({required this.value, required this.options, required this.labels, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: PPaymobileColors.lightGrey, width: 1.w)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
          items: List.generate(options.length, (i) => DropdownMenuItem(value: options[i], child: Text(labels[i]))),
          onChanged: (v) { if (v != null) onChanged(v); },
        ),
      ),
    );
  }
}
